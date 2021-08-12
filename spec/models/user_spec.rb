require 'rails_helper'

describe 'ユーザーモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザーの名前が空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: '', email: 'test1@example.com', password: 'password1')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: 'テスト太郎1', email: '', password: 'password1')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかる' do
        user = User.new(name: 'テスト太郎1', email: 'test1@example.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザーの名前、メールアドレス、パスワードが記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        expect(user).to be_valid
      end
    end
  end
end
