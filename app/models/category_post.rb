class CategoryPost < ApplicationRecord
  belongs_to :post
  belongs_to :category

  validates :name, presence: true
end
