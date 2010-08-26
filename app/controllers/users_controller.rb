class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user,    :only => [:show, :edit, :update]
  before_filter :find_user,       :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_to account_url
    else
      render :action => :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to(@user)
    else
      render :action => :edit
    end
  end

  private

  def find_user
    @user = @current_user
  end
end