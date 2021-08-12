FactoryBot.define do
  factory :user do
    name { "テスト太郎1" }
    email { "test1@example.com" }
    password { "password1" }
    password_confirmation { 'password1' }
    admin { false }
  end
  factory :user2, class: "User" do
    name { "テスト太郎2" }
    email { "test2@example.com" }
    password { "password2" }
    password_confirmation { 'password2' }
    admin { false }
  end
  factory :admin_user, class: "User" do
    name { "admin_user" }
    email { "admin_user@example.com" }
    password { "passwordadmin" }
    password_confirmation { 'passwordadmin' }
    admin { true }
  end
end
