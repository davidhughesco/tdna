class CandidatesController < ApplicationController
	before_action :authenticate_candidate!, only: [:show]

	def index
		@candidates = Candidate.all
	end

	def show
		@candidate = Candidate.find(params[:id])
	end

	def destroy
		@candidate = Candidate.find(params[:id])
		@candidate.destroy
		flash[:notice] = "Candidate successfully deleted"
	  	redirect_to candidates_path
	end

end