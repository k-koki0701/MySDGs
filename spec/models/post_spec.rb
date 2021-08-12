require 'rails_helper'

describe '投稿モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '投稿の本文が空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        post = Post.new(content: '', category_ids: category.id , user_id: user.id )
        expect(post).not_to be_valid
      end
    end
    context '投稿のカテゴリーが空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.create(:user)
        post = Post.new(content: 'ゴミ拾い', category_ids: "", user_id: user.id )
        expect(post).not_to be_valid
      end
    end
    context '投稿の本文とカテゴリーに内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        category = FactoryBot.create(:category)
        post = Post.new(content: 'ゴミ拾い', category_ids: category.id, user_id: user.id)
        expect(post).to be_valid
      end
    end
    context '投稿の本文とカテゴリーに内容が記載され、画像が登録された場合' do
      it 'バリデーションが通る' do
        post = FactoryBot.create(:post)
        expect(post).to be_valid
      end
    end
    context '投稿の本文とカテゴリーに内容が記載され、画像が複数枚登録された場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        guide = FactoryBot.create(:post_pictures, user_id: user.id)
        expect(guide).to be_valid
      end
    end
  end
end
