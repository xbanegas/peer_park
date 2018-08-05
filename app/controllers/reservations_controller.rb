class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /reservations
  # GET /reservations.json
  def index
		vehicle_reservations = Reservation.vehicle_by_user(current_user)
    @vehicle_reservations = Reservation.date_sort vehicle_reservations
    @vehicle_past_total = Reservation.total @vehicle_reservations[:past]
		@vehicle_upcoming_total = Reservation.total @vehicle_reservations[:current]
		@vehicle_upcoming_total += Reservation.total @vehicle_reservations[:future]

		space_reservations = Reservation.space_by_user(current_user)
		@space_reservations = Reservation.date_sort space_reservations
		@space_past_total = Reservation.total @space_reservations[:past]
		@space_upcoming_total = Reservation.total @space_reservations[:current]
		@space_upcoming_total += Reservation.total @space_reservations[:future]
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    @space_id = params[:space]
    @space = Space.find @space_id
    @plates = []
    current_user.vehicles.each do |vehicle|
      @plates << [vehicle[:license_plate], vehicle.id]
    end
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.vehicle = Vehicle.find(params[:license_plate])
    @reservation.start_time = DateTime.parse(params["reservation"]["start_time"] + ' EDT -04:00').utc
    respond_to do |format|
      if @reservation.save
        checkout @reservation, ((@reservation.space.hourly_rate * params[:reservation][:duration].to_i)/100)
        NewReservationWorker.new.perform_async(@reservation)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
    checkout
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def checkout reservation, amount
      # Amount in cents
      @amount = amount
      begin
        token = params[:stripeToken]
        charge = Stripe::Charge.create({
          amount: @amount *100,
          currency: 'usd',
          source: 'tok_visa',
          #receipt_email: 'jenny.rosen@example.com',
        })

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to root_path
      end
      reservation.paid = true
      reservation.save
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:space_id, :license_plate, :start_time, :confirmed, :paid, :duration)
    end
end
