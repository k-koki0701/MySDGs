FactoryBot.define do
  factory :event do
    title { 'ゴミ拾い' }
    content { '新宿駅前でゴミ拾いします！' }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/test_image1.jpg')) }
    schedule { DateTime.now.since(1.day) }
    category { FactoryBot.create(:category2) }
    owner { FactoryBot.create(:user2) }
  end
end
