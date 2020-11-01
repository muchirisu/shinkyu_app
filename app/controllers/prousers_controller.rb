class ProusersController < ApplicationController
  # priuserしかできないこと
  before_action :authenticate_prouser, {only: [:edit, :update]}
  # ログインしている場合、ログインページや新規登録できないようにする
  before_action :forbid_login_prouser, {only: [:new, :create, :login_form, :login]}

  before_action :ensure_correct_prouser, {only: [:edit, :update]}

  def index
    @prousers = Prouser.all
  end

  def show
    @prouser = Prouser.find_by(id: params[:id])
  end

  def new
    @prouser = Prouser.new
  end

  def create
    @prouser = Prouser.new(name: params[:name], email: params[:email], password: params[:password], birthday: params[:birthday], prefecture: params[:prefecture], image: "muchirisu.jpg")


    if @prouser.save
      session[:prouser_id] = @prouser.id
      flash[:notice] = "新規登録できました"
      redirect_to("/prousers/#{@prouser.id}")
    else
      flash[:notice] = "登録できませんでした"
      render("prousers/new")
    end
  end
  

  def edit
    @prouser = Prouser.find_by(id: params[:id])
  end

  def update
    @prouser = Prouser.find_by(id: params[:id])
    @prouser.name = params[:name]
    @prouser.email = params[:email]
    @prouser.content = params[:content]
    @prouser.adress = params[:adress]
    @prouser.access = params[:access]

    if params[:image]
      @prouser.image = "#{@prouser.id}.jpg"
      image = params[:image]
      File.binwrite("public/prouser_images/#{@prouser.image}", image.read)
    end

    if @prouser.save
      flash[:notice]="ユーザー情報を変更しました"
      redirect_to("/prousers/#{@prouser.id}")
    else
      flash[:notice]="ユーザー情報の変更に失敗しました"
      render("/prousers/edit")
    end
  end

  def login_form
  end

  def login
    # ユーザが存在するかの条件分岐(emailとpasswordが入力されたかで判断)
    # @prouser = Prouser.find_by(email: params[:email], password: params[:password])
    # メールアドレスのみで、ユーザーを取得しif文の条件を&&とauthenticateメソッドを用いて書き換える
    @prouser = Prouser.find_by(email: params[:email])
    if @prouser && @prouser.authenticate(params[:password])
      session[:prouser_id] = @prouser.id
      flash[:notice]=" ログインしました"
      redirect_to("/prousers/index")
    # 入力されなかったら、@error_messageを入力して、入力値を表示させる
    else
      @error_message = "メールアドレスまたはパスワードが間違えています"
      @email = params[:email]
      @password = params[:password]
      render("prousers/login_form")
    end
  end

  def logout 
    session[:prouser_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/prousers/login")
  end

  def likes 
    # idがparams[:id]のUserインスタンスをデータベースから取得
    @prouser = Prouser.find_by(id: params[:id])
    # @userと紐付くLikeインスタンスの配列をデータベースから取得
    @likes = Like.where(prouser_id: @prouser.id)
  end

  def profile
    @prouser = Prouser.find_by(id: params[:id])
  end

  def ensure_correct_prouser
    if @current_prouser.id != params[:id].to_i
      flash[:notice] = "編集する権限がありません"
      redirect_to("/posts/index")
    end 
  end
end