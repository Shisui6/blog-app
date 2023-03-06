class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: params[:user_id]).includes(:comments)
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
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

  private

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter).merge(user: current_user)
  end
end
