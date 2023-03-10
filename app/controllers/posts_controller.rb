class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.where(user_id: params[:user_id]).includes(:comments)
    @user = User.find(params[:user_id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @posts }
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
    @like = Like.new
  end

  def new
    @id = params[:user_id]
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'New post successfully added!'
      redirect_to user_posts_path
    else
      flash.now[:error] = 'Post creation failed'
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'The to-do item was successfully destroyed.'
    redirect_to user_posts_path user_id: current_user.id
  end

  private

  def post_params
    params.require(:post).permit(:title, :text).merge(user: current_user)
  end
end
