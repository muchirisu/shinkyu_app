class Newcomment < ApplicationRecord

  validates :post_id, {presence: true}
  validates :content, {presence: true}

  def newuser
    return Newuser.find_by(id: self.user_id)
  end

end
