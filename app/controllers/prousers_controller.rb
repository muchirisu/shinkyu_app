class ProusersController < ApplicationController
  def index
    @prousers = Prouser.all
  end

  def show
    @prouser = Prouser.find_by(id: params[:id])
    puts @prouser
  end

  def new
    @prouser = Prouser.new
  end

  def create
    @prouser = Prouser.new(name: params[:name], email: params[:email])
    if @prouser.save
      flash[:notice] = "新規登録できました"
      redirect_to("/prousers/#{@prouser.id}")
    else
      flash[:notice] = "登録できませんでした"
      render("/prousers/signup")
    end
  end


end
