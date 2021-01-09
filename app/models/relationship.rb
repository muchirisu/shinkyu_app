class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Newuser"
  belongs_to :following, class_name: "Newuser"
  
  validates :follower_id, {presence: true}
  validates :following_id, {presence: true}

  
end
