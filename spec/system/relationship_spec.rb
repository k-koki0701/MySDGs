require 'rails_helper'
RSpec.describe 'フォロー機能', type: :system do
  describe 'フォロー機能のテスト' do
    context 'ログインユーザーが自分のユーザー情報詳細ページを訪問した場合' do
      it '「フォローする」のリンクが表示されない' do
        @user = FactoryBot.create(:user)
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        click_on 'マイページ'
        expect(page).not_to have_button 'フォローする'
      end
    end
    context 'ログインユーザーが他者のユーザー情報詳細ページを訪問した場合' do
      it 'そのユーザーをフォローできる' do
        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user2)
        post = FactoryBot.create(:post, user_id: @user.id)
        visit new_user_session_path
        fill_in 'Email', with: 'test2@example.com'
        fill_in 'Password', with: 'password2'
        click_on 'commit'
        click_on 'テスト太郎1'
        click_on 'フォロー'
        expect(page).to have_button 'フォローを解除'
      end
    end
  end
end
