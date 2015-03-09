class RegistrationsController < Devise::RegistrationsController

protected

	def after_update_path_for(candidate)
		candidate_path(current_candidate)
	end

end