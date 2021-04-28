class Photo < ApplicationRecord
  belongs_to :user
  has_many :users, through: :comments
end
