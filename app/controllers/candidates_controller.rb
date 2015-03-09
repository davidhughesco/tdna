class CandidatesController < ApplicationController
	before_action :authenticate_administrator!, only: [:index, :report]
	before_action :authenticate_candidate!, only: [:show]

	def index
		@candidates = Candidate.all.order(:created_at)
	end

	def show
		@candidate = Candidate.find(params[:id])
		@needs_analyses = NeedsAnalysis.where('candidate_id = ?', params[:id])
		@role_candidates = RoleCandidate.where('candidate_id = ?', params[:id])
		@role_collaborator = RoleCollaborator.where('collaborator_id = ?', params[:id])
	end

	def report
		@disable_nav = true
		@candidate = Candidate.find(params[:id])
		@collaborator = Candidate.find(@candidate.collaborator_id)
		@role_candidate = @candidate.role_candidate
		@role_collaborator = @candidate.role_collaborator
		@search = NeedsAnalysis.ransack(params[:q])
		@needs_analyses = @search.result.where('candidate_id = ?', params[:id])
		@grouped_areas = @needs_analyses.group_by &:area
	end

	def collaborator_instructions
		@candidate = Candidate.find(params[:id])
		session[:candidate_id] = @candidate.id
		redirect_to root_path, notice: "You are not authorised to access this." if @candidate.collaborator_id != current_candidate.id
		@needs_analyses = NeedsAnalysis.where('candidate_id = ?', params[:id])
		@role_candidates = RoleCandidate.where('candidate_id = ?', params[:id])
	end

	def instructions
		@candidate = Candidate.find(params[:id])
		@needs_analyses = NeedsAnalysis.where('candidate_id = ?', params[:id])
	end

	def destroy
		@candidate = Candidate.find(params[:id])
		@candidate.destroy
		flash[:notice] = "Candidate successfully deleted"
	  	redirect_to candidates_path
	end

end