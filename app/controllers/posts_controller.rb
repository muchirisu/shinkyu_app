class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "○○のために投稿失敗しました"
      render("/posts/new")
    end
  end
  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      flash[:notice] = "○○のために投稿編集に失敗しました"
      render("/posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end

end