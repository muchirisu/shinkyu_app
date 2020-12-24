class Newuser < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  # validates :password_digest, format: { with: /\A\d+-\d+-\d+\z/}
  

  def newposts
    return Newpost.where(newuser_id: self.id)
  end
  
end
