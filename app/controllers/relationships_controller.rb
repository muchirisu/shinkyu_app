class RelationshipsController < ApplicationController

  def create
    follow = @current_newuser.active_relationships.build(follower_id: params[:newuser_id])
    follow.save
    redirect_to newusers_path
  end

  def destroy
    follow = @current_newuser.active_relationships.find_by(follower_id: params[:newuser_id])
    follow.destroy
    redirect_to newusers_path
  end

end
