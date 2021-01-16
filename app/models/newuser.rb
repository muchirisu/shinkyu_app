class Newuser < ApplicationRecord
  has_secure_password

  validates :name, {presence: true}
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)\z/
  validates :email, {uniquess: true, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }}
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,12}\z/
  validates :password, {format: { with: VALID_PASSWORD_REGEX, message: "6~12文字の半角英小文字・数字それぞれ１文字以上含む必要があります"}}
  validates :content, {length: { maximum: 200}}

  #フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
  has_many :active_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  # 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
  has_many :followings, through: :active_relationships, source: :follower
  #フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
  has_many :passive_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  # 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
  has_many :followers, through: :passive_relationships, source: :following
  def newposts
    return Newpost.where(newuser_id: self.id)
  end

  def followed_by?(newuser)
    # 今自分(引数のnewuser)がフォローしようとしているユーザー(レシーバー)がフォローされているユーザー(つまりpassive)の中から、引数に渡されたユーザー(自分)がいるかどうかを調べる
    passive_relationships.find_by(following_id: newuser.id).present?
  end

end
