class Post < ApplicationRecord
  validates :content, {length: {maximum: 200}, presence: true}
  validates :prouser_id, {presence: true}

  def prouser
    return Prouser.find_by(id: self.prouser_id)
  end

  def user
    return User.find_by(id: self.user_id)
  end
end
