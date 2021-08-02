class Category < ApplicationRecord
  has_many :category_post
  has_many :posts, through: :category_post
end
