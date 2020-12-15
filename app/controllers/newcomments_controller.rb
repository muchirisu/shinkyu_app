class NewcommentsController < ApplicationController

  before_action :authenticate_newuser , {only: [:create]}
  before_action :ensure_correct_newuser, {only: [:edit, :destroy]}

  def new
    @newomment = Newomment.new
  end

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

  def edit
    @newcomment = Newcomment.find_by(id: params[:id])
  end

  def update
    @newcomment = Newcomment.find_by(id: params[:id])
    @newcomment.content = params[:content]
    if @newpost.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/newposts/index")
    else
      render("/newposts/edit")
    end
  end

  def destroy
    @newcomment = Newcomment.find_by(post_id: params[:post_id])
    @newcomment.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/newposts/index")
  end

  def ensure_correct_newuser
    @newcomment = Newcomment.find_by(id: params[:id])
    if @newcomment.newuser_id != @current_newuser.id 
      flash[:notice] = "編集する権限はありません"
      redirect_to("/newposts/index")
    end
  end

  
end
