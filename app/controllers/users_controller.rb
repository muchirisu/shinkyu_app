class UsersController < ApplicationController
  # ログインしていない時にページにURLで直接ログインできないようにする
  before_action :authenticate_user, {only: [:show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}
  def index
    @user = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], birthday: params[:birthday], prefecture: params[:prefecture], image: "star.jpg")

    if @user.save
      session[:user_id] = @user.id
      flash[:notice]= "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:notice] = "登録できませんでした"
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    # データを受け取り、ユーザー情報を取得して、新しい情報をデータベースに保存されるようにする
    @user.name = params[:name]
    @user.email = params[:email]

    if params[:image]
      @user.image = "#{@user.id}.jpg"
      image = params[:image]
      # File.binwriteを用いて画像データをpublic/user_image内にidを含んだ名前で保存する
      File.binwrite("public/user_images/#{@user.image}", image.read)
    end

    if @user.save
      flash[:notice]= "ユーザー情報を変更しました"
      redirect_to("/users/#{@user.id}")
    else
      flash[:notice]="ユーザー情報の変更に失敗しました"
      render("/users/edit")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice]=" ログインしました"
      redirect_to("/users/#{@user.id}")
    else
      @error_message = "メールアドレスまたはパスワードが間違えています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/users/login")
  end

  def likes
    # idがparams[:id]のUserインスタンスをデータベースから取得
    @user = User.find_by(id: params[:id])
    # @userと紐付くLikeインスタンスの配列をデータベースから取得
    @likes = Like.where(user_id: @user.id)
  end

  def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
end