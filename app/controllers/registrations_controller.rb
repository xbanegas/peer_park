class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)


		if CGI.parse(URI.parse(request.headers["Referer"]).query)["list"][0] == "true"
			new_space_path
		else
			new_vehicle_path
		end
  end
end
