class ApplicationController < ActionController::Base
  #全てのコントラーで以下のメソッドを呼び出すことができる
  before_action :set_current_prouser
  before_action :set_current_user

  def set_current_prouser
    @current_prouser = Prouser.find_by(id: session[:prouser_id])
  end

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_prouser
    if @current_prouser == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/prousers/login")
    end
  end

  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/users/login")
    end
  end

  def forbid_login_prouser
    if @current_prouser
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
end
