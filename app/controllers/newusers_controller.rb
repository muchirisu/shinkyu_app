class NewusersController < ApplicationController
  before_action :authenticate_newuser, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_newuser, {only: [:new, :create, :login_form, :login]}
  # URLを直接入力してのページへのアクセスを防ぐ
  before_action :ensure_correct_newuser, {only: [:edit, :update]}
  def index
    @newusers = Newuser.where(user_type: 2)
  end

  def show
    @newuser = Newuser.find_by(id: params[:id])
  end
  
  def new
    @newuser = Newuser.new
  end

  def create
    @newuser = Newuser.new(user_type: params[:user_type], name: params[:name], email: params[:email], password: params[:password], birthday: params[:birthday], prefecture: params[:prefecture], image: "pc.jpg")

    if @newuser.save
      session[:user_id] = @newuser.id
      flash[:notice] = "新規登録できました"
      redirect_to("/newusers/index")
    else
      flash[:notice] = "登録できませんでした"
      render("newusers/new")
    end
  end

  def edit
    @newuser = Newuser.find_by(id: params[:id])
  end

  def update
    @newuser = Newuser.find_by(id: params[:id])
    @newuser.name = params[:name]
    @newuser.email = params[:email]
    @newuser.content = params[:content]
    @newuser.address = params[:address]
    @newuser.access = params[:access]

    if params[:image]
      @newuser.image = "#{@newuser.id}.jpg"
      image = params[:image]
      File.binwrite("public/newuser_images/#{@newuser.image}", image.read)
    end

    if @newuser.save
      flash[:notice]="ユーザー情報を変更しました"
      redirect_to("/newusers/#{@newuser.id}")
    else
      flash[:notice]="ユーザー情報の変更に失敗しました"
      render("/newusers/edit")
    end
  end

  def login_form
  end

  def login
    # ユーザが存在するかの条件分岐(emailとpasswordが入力されたかで判断)
    # @prouser = Prouser.find_by(email: params[:email], password: params[:password])
    # メールアドレスのみで、ユーザーを取得しif文の条件を&&とauthenticateメソッドを用いて書き換える
    # password_digest: params[:password]をfind_byからはずす。
    @newuser = Newuser.find_by(email: params[:email])
    if @newuser&& @newuser.authenticate(params[:password])
      session[:user_id] = @newuser.id
      flash[:notice]=" ログインしました"
      redirect_to("/newusers/index")
    # 入力されなかったら、@error_messageを入力して、入力値を表示させる
    else
      @error_message = "メールアドレスまたはパスワードが間違えています"
      @email = params[:email]
      @password = params[:password]
      render("newusers/login_form")
    end
  end

  def logout 
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/newusers/login")
  end

  def likes
    @newuser = Newuser.find_by(id: params[:id])
    # @userと紐付くLikeインスタンスの配列をデータベースから取得
    @newlikes = Newlike.where(user_id: @newuser.id)
  end
  
  def profile
    @newuser = Newuser.find_by(id: params[:id])
  end


  def follows
    newuser = Newuser.find(params[:id])
    @newusers = newuser.followings
  end

  def followers
    newuser = Newuser.find(params[:id])
    @newusers = newuser.followers
  end

  # ログイン中のユーザーのidと編集したいユーザーのidが等しいか判定
  def ensure_correct_newuser
    if @current_newuser.id != params[:id].to_i
      flash[:notice] = "編集する権限がありません"
      redirect_to("/newposts/index")
    end 
  end



end
