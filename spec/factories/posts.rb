FactoryBot.define do
  factory :post do
    content { 'ゴミ拾い' }
    user { FactoryBot.create(:user)}
    after(:build) do |post|
      post.pictures << FactoryBot.build(:picture, post: post)
    end
    after(:build) do |post|
      post.category_ids << FactoryBot.build(:category)
    end
  end

  factory :picture do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image1.jpg"), 'image/jpg') }
  end

  factory :picture2, class: "Picture" do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image2.jpg"), 'image/jpg') }
  end

  factory :picture3, class: "Picture" do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image3.jpg"), 'image/jpg') }
  end

  factory :picture4, class: "Picture" do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image4.jpg"), 'image/jpg') }
  end

  factory :picture5, class: "Picture" do
    image   { Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image5.jpg"), 'image/jpg') }
  end

  factory :post_pictures, class: "Post" do
    content { 'ゴミ拾い' }
    after(:build) do |post|
     post.pictures << FactoryBot.build(:picture ,post:post)
     post.pictures << FactoryBot.build(:picture2 ,post:post)
     post.pictures << FactoryBot.build(:picture3 ,post:post)
     post.pictures << FactoryBot.build(:picture4 ,post:post)
     post.pictures << FactoryBot.build(:picture5 ,post:post)
    end
    after(:build) do |post|
      post.category_ids << FactoryBot.build(:category)
    end
  end

end
