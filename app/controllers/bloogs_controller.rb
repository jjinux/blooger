class BloogsController < ApplicationController
  def index
    @bloogs = User.all
  end

  def show
    @bloog = User.find(params[:id])
  end

  def atom
    @bloog = User.find(params[:id])
    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
end