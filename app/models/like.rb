class Like < ApplicationRecord
  # prouser_id or user_idのどちらかがあったら
  validates :prouser_id, presence: true, if: -> {user_id.blank? }
  validates :user_id, presence: true, if: -> {prouser_id.blank? }

  validates :post_id, {presence: true}
end
