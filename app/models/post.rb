class Post < ApplicationRecord
  belongs_to :user

  has_many :category_post
  has_many :categories, through: :category_post
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :good_users, through: :goods, source: :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures

  validates :content, presence: true
end
