class PagesController < ApplicationController
  def home
  	@disable_header = true
  end

  def admin
  	redirect_to new_administrator_session_path
  end
end