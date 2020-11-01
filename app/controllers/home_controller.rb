class HomeController < ApplicationController
  before_action :forbid_login_prouser, {only: [:top]}
  before_action :forbid_login_user, {only: [:top]}
  def top
  end
end
