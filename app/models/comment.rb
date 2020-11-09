class Comment < ApplicationRecord
  
# prouser_id or user_idのどちらかがあったら
validates :prouser_id, presence: true, if: -> {user_id.blank? }
validates :user_id, presence: true, if: -> {prouser_id.blank? }

validates :post_id, {presence: true}
validates :comment_content, {presence: true}

def prouser
  return Prouser.find_by(id: self.prouser_id)
end

def user
  return User.find_by(id: self.user_id)
end




end
