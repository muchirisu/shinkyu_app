class User < ApplicationRecord
  has_secure_password
  has_many :comments, dependent: :destroy

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}


  def prouser
    return Prouser.find_by(id: self.prouser_id)
  end

  def posts
    return Post.where(id: self.prouser_id)
  end
end
