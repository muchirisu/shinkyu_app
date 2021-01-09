class Newuser < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)\z/
  validates :email, {presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
  validates :password, {format: { with: VALID_PASSWORD_REGEX, message: "6~12文字の半角英小文字・数字それぞれ１文字以上含む必要があります"}}
  validates :content, {length: { maximum: 200}}

  # ユーザーのフォローしている人からみたフォローしている人の取得
  has_many :active_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  #自分がフォローしている人の取得
  has_many :followings, through: :active_relationships, source: :follower
  #ユーザーのフォローされている人からみたフォローされている人の取得
  has_many :passive_relationships, foreign_key: "follower_id",class_name: "Relationship", dependent: :destroy
  #自分をフォローしている人（自分がフォローされている人）の取得
  has_many :followers, through: :passive_relationship, source: :following
  def newposts
    return Newpost.where(newuser_id: self.id)
  end

  #フォローしようとしている人が自分自身でないかの検証
  def follow(other_user)
    unless self == other_user
    self.active_relationships.create(following_id: other_user.id)
    end
  end
  #ユーザーのフォローを解除する
  def unfollow(other_user)
    self.active_relationships.find_by(following_id: other_user.id).destroy
  end
  #すでにフォロー済みか検証する
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
end
