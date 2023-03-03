class LikesController < ApplicationController
  def create
    @user_id = params[:user_id]
    @post_id = params[:post_id]
    @like = Like.new(user: current_user, post: Post.find_by(id: @post_id))
    if @like.save
      flash[:success] = 'New like successfully added!'
      redirect_to "/users/#{@user_id}/posts/#{@post_id}"
    else
      flash.now[:error] = 'Like creation failed'
      render :new
    end
  end
end
