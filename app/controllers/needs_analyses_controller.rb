class NeedsAnalysesController < ApplicationController
  before_action :authenticate_administrator!, only: :index
  before_action :set_needs_analysis, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @needs_analyses = NeedsAnalysis.all
    @grouped_analyses = @needs_analyses.group_by &:candidate
  end

  def show
    respond_with(@needs_analysis)
  end

  def new
    @needs_analysis = NeedsAnalysis.new
    respond_with(@needs_analysis)
  end

  def edit
  end

  def create
    @needs_analysis = NeedsAnalysis.new(needs_analysis_params)
    @needs_analysis.save
    respond_with(@needs_analysis)
  end

  def update
    @needs_analysis.update(needs_analysis_params)
    respond_with(@needs_analysis)
  end

  # Candidate's edit controllers

  def edit_candidate
    @candidate = current_candidate
    @needs_analyses = NeedsAnalysis.find(params[:needs_analysis_ids]).sort_by &:order_id
  end

  def update_candidate
    NeedsAnalysis.update(params[:needs_analyses].keys, params[:needs_analyses].values)
    current_candidate.increment!(:tdna_visits)
    flash[:notice] = "Responses saved successfully"
    redirect_to candidate_path(current_candidate)
  end

  # Collaborator's edit controllers

  def edit_collaborator
    @candidate = Candidate.find(session[:candidate_id])
    @needs_analyses = NeedsAnalysis.find(params[:needs_analysis_ids]).sort_by &:order_id
    @grouped_areas = @needs_analyses.group_by &:area
  end

  def update_collaborator
    NeedsAnalysis.update(params[:needs_analyses].keys, params[:needs_analyses].values)
    flash[:notice] = "Responses saved successfully"
    @candidate = Candidate.find(session[:candidate_id])
    @candidate.increment!(:collaborator_tdna_visits)
    session.delete(:candidate_id)
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @needs_analysis.destroy
    respond_with(@needs_analysis)
  end

  private
    def set_needs_analysis
      @needs_analysis = NeedsAnalysis.find(params[:id])
    end

    def needs_analysis_params
      params.require(:needs_analysis).permit(:candidate_id, :collaborator_id, :activity_id, :area_id, :order_id, :relevance, :interest, :skill, :current_relevance, :future_relevance)
    end
end
