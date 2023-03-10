class CommentsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @comments }
      format.json { render json: @comments }
    end
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = Post.find(params[:post_id])
    if @comment.save
      flash[:success] = 'New comment successfully added!'
      respond_to do |format|
        format.html { redirect_to user_post_path user_id: current_user.id, id: @comment.post.id }
        format.xml { render xml: @comment, status: :created }
        format.json { render json: @comment, status: :created }
      end
    else
      flash.now[:error] = 'Comment creation failed'
      respond_to do |format|
        format.html { render :new }
        format.xml { render xml: @comment.errors, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'The comment item was successfully destroyed.'
    redirect_to user_post_path user_id: current_user.id
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
