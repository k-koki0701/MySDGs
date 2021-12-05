class Post < ApplicationRecord
  belongs_to :user

  has_many :category_post, dependent: :destroy
  has_many :categories, through: :category_post
  has_many :goods, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :good_users, through: :goods, source: :user
  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :content, presence: true
  validates :category_ids, presence: true

  scope :categories_ranking_month, -> { joins(:categories).group("categories.name").where(created_at: Time.current.all_month).order('count_all DESC').limit(3).count }

  scope :categories_ranking_year, -> { joins(:categories).group("categories.name").where(created_at: Time.current.all_year).order('count_all DESC').limit(3).count }

  scope :post_list, -> { all.includes(:user, :pictures, :goods).order('id DESC') }

end
