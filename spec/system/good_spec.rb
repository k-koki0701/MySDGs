require 'rails_helper'
RSpec.describe 'いいね機能', type: :system do
  describe 'いいね機能のテスト' do
    context '投稿一覧画面で自分が作成した投稿の場合' do
      it '「お気に入り登録する」のリンクが表示されない' do
        @user = FactoryBot.create(:user)
        post = FactoryBot.create(:post, user_id: @user.id)
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        expect(page).not_to have_selector '#post-index-ungood'
      end
    end
    context '投稿一覧画面で他のユーザーが作成した投稿の場合' do
      it 'お気に入り登録ができる' do
        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user2)
        post = FactoryBot.create(:post, user_id: @user.id)
        visit new_user_session_path
        fill_in 'Email', with: 'test2@example.com'
        fill_in 'Password', with: 'password2'
        click_on 'commit'
        click_on 'post-index-ungood'
        get 'goback'
        expect(page).to have_css '#post-index-good'
      end
    end
  end
end
