class RoleCandidatesController < ApplicationController
  before_action :set_role_candidate, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @role_candidates = RoleCandidate.all
    respond_with(@role_candidates)
  end

  def show
    respond_with(@role_candidate)
  end

  def new
    @role_candidate = RoleCandidate.new
    respond_with(@role_candidate)
  end

  def edit
  end

  def create
    @role_candidate = RoleCandidate.new(role_candidate_params)
    @role_candidate.save
    respond_with(@role_candidate)
  end

  def update
    @role_candidate.update(role_candidate_params)
    respond_with(@role_candidate)
  end

  def destroy
    @role_candidate.destroy
    respond_with(@role_candidate)
  end

  private
    def set_role_candidate
      @role_candidate = RoleCandidate.find(params[:id])
    end

    def role_candidate_params
      params.require(:role_candidate).permit(:candidate_id, :current_role, :time_in_role, :previous_role, :next_role, :qualifications, :previous_role_context, :current_role_context, :next_role_context, :main_aspect_a, :main_aspect_b, :main_aspect_c, :main_aspect_d, :main_aspect_e, :main_aspect_importance_a, :main_aspect_importance_b, :main_aspect_importance_c, :main_aspect_importance_d, :main_aspect_importance_e, :main_aspect_enjoyment_a, :main_aspect_enjoyment_b, :main_aspect_enjoyment_c, :main_aspect_enjoyment_d, :main_aspect_enjoyment_e, :secondary_aspect, :unnecessary_aspect, :short_term_training, :medium_term_training, :long_term_training)
    end
end
