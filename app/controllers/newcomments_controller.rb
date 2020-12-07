class NewcommentsController < ApplicationController

  before_action :authenticate_newuser , {only: [:create]}
  

  def create
    @newcomment = Newcomment.new(
      content: params[:content],
      user_id: @current_newuser.id,
      post_id: params[:post_id]
      # user_type: @current_newuser.user_type:2
    )
    if @newcomment.save
      flash[:notice] = "投稿しました"
      redirect_to("/newposts/#{params[:post_id]}")
    end
  end

  def destroy
    @newcomment = Newcomment.find_by(post_id: params[:post_id])
    @newcomment.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/newposts/index")
  end


  
end
