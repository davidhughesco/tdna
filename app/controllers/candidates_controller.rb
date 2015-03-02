class CandidatesController < ApplicationController
	before_action :authenticate_candidate!, only: [:show]

	def index
		@candidates = Candidate.all
	end

	def show
		@candidate = Candidate.find(params[:id])
		@needs_analyses = NeedsAnalysis.where('candidate_id = ?', params[:id])
		@role_candidates = RoleCandidate.where('candidate_id = ?', params[:id])
	end

	def collaborator_show
		@candidate = Candidate.find(params[:id])
		# redirect_to root_path, notice: "You are not authorised to access this." if @candidate.collaborator_id != current_candidate.id
		@needs_analyses = NeedsAnalysis.where('candidate_id = ?', params[:id])
		@role_candidates = RoleCandidate.where('candidate_id = ?', params[:id])
	end

	def destroy
		@candidate = Candidate.find(params[:id])
		@candidate.destroy
		flash[:notice] = "Candidate successfully deleted"
	  	redirect_to candidates_path
	end

end