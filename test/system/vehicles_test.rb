require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "creating a Vehicle" do
    visit vehicles_url
    click_on "New Vehicle"

    fill_in "Color", with: @vehicle.color
    fill_in "License Plate", with: @vehicle.license_plate
    fill_in "Make", with: @vehicle.make
    fill_in "Model", with: @vehicle.model
    fill_in "User", with: @vehicle.user_id
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "updating a Vehicle" do
    visit vehicles_url
    click_on "Edit", match: :first

    fill_in "Color", with: @vehicle.color
    fill_in "License Plate", with: @vehicle.license_plate
    fill_in "Make", with: @vehicle.make
    fill_in "Model", with: @vehicle.model
    fill_in "User", with: @vehicle.user_id
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "destroying a Vehicle" do
    visit vehicles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Vehicle was successfully destroyed"
  end
end
