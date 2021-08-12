require 'rails_helper'

describe 'イベントモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'イベントのタイトルが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        post = Post.new(content: '', category_ids: category.id , user_id: user.id )
        expect(post).not_to be_valid
      end
    end
    context 'イベントの本文が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        post = Post.new(content: 'ゴミ拾い', category_ids: "", user_id: user.id )
        expect(post).not_to be_valid
      end
    end
    context 'イベントのカテゴリーが空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        post = Post.new(content: 'ゴミ拾い', category_ids: category.id, user_id: user.id)
        expect(post).to be_valid
      end
    end
    context 'イベントの画像が空の場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.create(:post)
        expect(post).to be_valid
      end
    end
    context 'イベントの日時が空の場合' do
      it 'バリデーションにひっかかる' do
        post = FactoryBot.create(:post)
        expect(post).to be_valid
      end
    end
    context '' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        post = FactoryBot.create(:post_pictures, user_id: user.id)
        expect(guide).to be_valid
      end
    end
  end
end
