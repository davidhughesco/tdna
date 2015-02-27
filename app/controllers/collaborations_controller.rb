class CollaborationsController < ApplicationController

	def index
		@collaborations = Collaboration.all
	end

	def create
	  @collaboration = current_candidate.collaborations.build(:collaborator_id => params[:collaborator_id])
	  if @collaboration.save
	    flash[:notice] = "Added collaborator."
	    redirect_to root_url
	  else
	    flash[:error] = "Unable to add collaborator."
	    redirect_to root_url
	  end
	end

	def destroy
	  @collaboration = current_candidate.collaborations.find(params[:id])
	  @collaboration.destroy
	  flash[:notice] = "Removed collaboration."
	  redirect_to current_candidate
	end

end
