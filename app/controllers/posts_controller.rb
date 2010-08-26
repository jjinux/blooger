class PostsController < ApplicationController
  before_filter :require_user
  before_filter :find_post, :only => [:show, :edit, :update]

  def index
    @posts = current_user.posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post]) do |p|
      p.user = current_user
    end
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to user_post_url(:user_id => current_user, :id => @post)
    else
      render :action => "new"
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to user_post_url(:user_id => current_user, :id => @post)
    else
      render :action => "edit"
    end
  end

  private

  def find_post
    current_user.posts.find(params[:id])
  end
end