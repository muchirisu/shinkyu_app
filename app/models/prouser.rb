class Prouser < ApplicationRecord

  has_secure_password

  has_many :comments, dependent: :destroy

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :content, {length: {maximum: 20}}
  

#ユーザー詳細ページに投稿一覧を表示するために、postsメソッドを定義する
def posts
  return Post.where(prouser_id: self.id) 
end

def user
  return User.find_by(id: self.user_id)
end
end
