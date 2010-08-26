class BloogsController < ApplicationController
  def index
    @bloogs = User.all
  end

  def show
    @bloog = User.find(params[:id])
  end
end
