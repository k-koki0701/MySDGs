class Category < ApplicationRecord
  has_many :events
  has_many :category_post, dependent: :destroy
  has_many :posts, through: :category_post

  validates :name, presence: true
end
