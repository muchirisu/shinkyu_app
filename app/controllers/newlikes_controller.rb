class NewlikesController < ApplicationController
  before_action :authenticate_newuser , {only: [:create]}

  def create
    @newlike = Newlike.new(
      user_id: @current_newuser.id,
      post_id: params[:post_id]
    )
    @newlike.save
    redirect_to("/newposts/#{params[:post_id]}")
  end

  def destroy
    @newlike = Newlike.find_by(
      user_id: @current_newuser.id,
      post_id: params[:post_id]
    )
    @newlike.destroy
    redirect_to("/newposts/#{params[:post_id]}")
  end

end
