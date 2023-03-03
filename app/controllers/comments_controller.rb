class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    @comment = Comment.new(comment_params(@post_id))
    if @comment.save
      flash[:success] = 'New comment successfully added!'
      redirect_to "/users/#{@user_id}/posts/#{@post_id}"
    else
      flash.now[:error] = 'Comment creation failed'
      render :new
    end
  end

  private

  def comment_params(id)
    params.require(:comment).permit(:text).merge(user: current_user, post: Post.find_by(id:))
  end
end
