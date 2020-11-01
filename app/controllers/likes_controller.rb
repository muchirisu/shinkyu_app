class LikesController < ApplicationController
  before_action :authenticate_prouser , {only: [:prouser_create]}
  before_action :authenticate_user , {only: [:user_create]}

  def user_create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def prouser_create
    @like = Like.new(
      prouser_id: @current_prouser.id,
      post_id: params[:post_id]
    )
    @like.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def user_destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end

  def prouser_destroy
    @like = Like.find_by(
      prouser_id: @current_prouser.id,
      post_id: params[:post_id]
    )
    @like.destroy
    redirect_to("/posts/#{params[:post_id]}")
  end

end