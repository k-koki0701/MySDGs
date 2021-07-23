class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :goods, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "ゲスト"
      user.password = SecureRandom.urlsafe_base64
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
end
