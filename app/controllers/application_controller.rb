class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_filter :configure_permitted_parameters, if: :devise_controller?

	# Device redirects after sign in

	def after_sign_in_path_for(resource)
  		if candidate_signed_in?
  			candidate_path(current_candidate)
  		elsif administrator_signed_in?
  			candidates_path
  		else
  			root_path
  		end
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :collaborator_id, :organisation_id, :organisation_name, :password, :passcode) }
		devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :collaborator_id, :organisation_id, :organisation_name, :password, :current_password) }
	end
end
