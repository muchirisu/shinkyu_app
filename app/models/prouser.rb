class Prouser < ApplicationRecord
  validates :email, {uniqueness: true}
end
