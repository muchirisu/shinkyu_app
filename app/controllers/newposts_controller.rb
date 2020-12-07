class NewpostsController < ApplicationController
  # URLから直接ログインできないようにする
  before_action :ensure_correct_newuser, {only: [:edit, :update, :destroy]}
  
  def index
    @newposts = Newpost.all.order(created_at: :desc)
  end

  def show
    @newpost = Newpost.find_by(id: params[:id])
    # @newuser = Newuser.find_by(id: @newpost.user_id)
    @newuser = @newpost.newuser
    @newlikes_count = Newlike.where(post_id: @newpost.id).count
    @newcomments = Newcomment.where(post_id: @newpost.id).order(created_at: :desc)
    

  end

  def new
    @newpost = Newpost.new
  end

  def create
    @newpost = Newpost.new(
      content: params[:content],
      newuser_id: @current_newuser.id,
      user_type: 2,
      # user_type: @current_newuser.user_type:2
    )
    if @newpost.save
      flash[:notice] = "投稿しました"
      redirect_to("/newposts/index")
    else
      flash[:notice] = "○○のために投稿失敗しました"
      render("/newposts/new")
    end
  end

  def edit
    @newpost = Newpost.find_by(id: params[:id])
  end

  def update
    @newpost = Newpost.find_by(id: params[:id])
    @newpost.content = params[:content]
    if @newpost.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/newposts/index")
    else
      render("/newposts/edit")
    end
  end

  def destroy
    @newpost = Newpost.find_by(id: params[:id])
    @newpost.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/newposts/index")
  end

  def ensure_correct_newuser
    @newpost = Newpost.find_by(id: params[:id])
    if @newpost.newuser_id != @current_newuser.id
      flash[:notice] = "編集する権限はありません"
      redirect_to("/newposts/index")
    end
  end



end
