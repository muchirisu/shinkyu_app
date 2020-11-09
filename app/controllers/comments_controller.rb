class CommentsController < ApplicationController
  before_action :authenticate_prouser , {only: [:prouser_create]}
  before_action :authenticate_user , {only: [:user_create]}


  def user_create
    @comment = Comment.new(
      user_id: @current_user.id,
      post_id: params[:post_id],
      comment_content: params[:comment_content]
    )
    @comment.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  def prouser_create
    @comment = Comment.new(
      prouser_id: @current_prouser.id,
      post_id: params[:post_id],
      comment_content: params[:comment_content]
    )
    @comment.save
    redirect_to("/posts/#{params[:post_id]}")
  end

  
end
