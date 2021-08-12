require 'rails_helper'

describe '投稿モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context '投稿の本文が空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.create(:user)
        category = Category.new(name: 'ゴミ拾い')
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
  end
end
