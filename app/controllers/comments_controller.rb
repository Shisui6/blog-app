class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    puts @comment.inspect
    if @comment.save
      flash[:success] = 'New comment successfully added!'
      redirect_to user_post_path user_id: current_user.id, id: @comment.post.id
    else
      flash.now[:error] = 'Comment creation failed'
      render :new
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'The to-do item was successfully destroyed.'
    redirect_to user_post_path user_id: current_user.id
  end

  private

  # def comment_params(id)
  #   params.require(:comment).permit(:text).merge(user: current_user, post: Post.find_by(id:))
  # end
  def comment_params
    params.require(:comment).permit(:text)
  end
end
