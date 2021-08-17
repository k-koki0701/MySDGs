require 'rails_helper'

describe 'イベントモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'イベントのタイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        event = Event.new(title: '', content: '海でゴミ拾いします！', image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image1.jpg")), schedule: "2021/08/11 12:00", owner_id: user.id, category_id: category.id)
        expect(event).not_to be_valid
      end
    end
    context 'イベントの本文が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        event = Event.new(title: '海を綺麗にしよう', content: '', image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image1.jpg")), schedule: "2021/08/11 12:00", owner_id: user.id, category_id: category.id)
        expect(event).not_to be_valid
      end
    end
    context 'イベントの画像が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        event = Event.new(title: '海を綺麗にしよう', content: '海でゴミ拾いします！', image: '', schedule: "2021/08/11 12:00", owner_id: user.id, category_id: category.id)
        expect(event).not_to be_valid
      end
    end
    context 'イベントのカテゴリーが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        event = Event.new(title: '海を綺麗にしよう', content: '海でゴミ拾いします！', image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image1.jpg")), schedule: "2021/08/11 12:00", owner_id: user.id, category_id: '')
        expect(event).not_to be_valid
      end
    end
    context 'イベントの日時が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        event = Event.new(title: '海を綺麗にしよう', content: '海でゴミ拾いします！', image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image1.jpg")), schedule: "", owner_id: user.id, category_id: category.id)
        expect(event).not_to be_valid
      end
    end
    context 'イベントのタイトル、本文、画像、日時、カテゴリーが全て記載されている' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        event = Event.new(title: '海を綺麗にしよう', content: '海でゴミ拾いします！', image: Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/test_image1.jpg")), schedule: "#{DateTime.now.since(1.day)}", owner_id: user.id, category_id: category.id)
        expect(event).to be_valid
      end
    end
  end
end
