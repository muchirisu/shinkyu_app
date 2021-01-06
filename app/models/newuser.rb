class Newuser < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)\z/
  validates :email, {presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
  validates :password, {format: { with: VALID_PASSWORD_REGEX, message: "6~12文字の半角英小文字・数字それぞれ１文字以上含む必要があります"}}
  validates :content, {length: { maximum: 200}}
  # validates :password_digest, format: { with: /\A\d+-\d+-\d+\z/}
  



  

  def newposts
    return Newpost.where(newuser_id: self.id)
  end
  
end
