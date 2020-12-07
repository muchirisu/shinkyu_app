class Newpost < ApplicationRecord

  validates :content, {length: {maximum: 200}, presence: true}
  validates :newuser_id, {presence: true}
  validates :user_type, {presence: true}

  # postで使えるようにnewuserメソッドを定義したい
  # 以下のインスタンスメソッドを使って投稿一覧にユーザーの名前を入れたり、ユーザー画像を表示する
  def newuser
    return Newuser.find_by(id: self.newuser_id)
  end

end
