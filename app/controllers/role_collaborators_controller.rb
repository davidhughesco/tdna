class RoleCollaboratorsController < ApplicationController
  before_action :authenticate_administrator!, only: :index
  before_action :set_role_collaborator, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @role_collaborators = RoleCollaborator.all
    respond_with(@role_collaborators)
  end

  def show
    respond_with(@role_collaborator)
  end

  def new
    @role_collaborator = RoleCollaborator.new
    respond_with(@role_collaborator)
  end

  def edit
  end

  def create
    @role_collaborator = RoleCollaborator.new(role_collaborator_params)
    @role_collaborator.save
    respond_with(@role_collaborator)
  end

  def update
    @role_collaborator.update(role_collaborator_params)
    flash[:notice] = "Responses saved successfully"
    @role_collaborator.candidate.increment!(:collaborator_role_visits)
    redirect_to candidate_path(current_candidate)
  end

  def destroy
    @role_collaborator.destroy
    respond_with(@role_collaborator)
  end

  private
    def set_role_collaborator
      @role_collaborator = RoleCollaborator.find(params[:id])
    end

    def role_collaborator_params
      params.require(:role_collaborator).permit(:candidate_id, :collaborator_id, :current_role, :next_role, :current_role_context, :next_role_context, :main_aspect_1, :main_aspect_2, :main_aspect_3, :main_aspect_4, :main_aspect_5)
    end
end
