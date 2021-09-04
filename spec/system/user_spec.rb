require 'rails_helper'
RSpec.describe 'ユーザー機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'ユーザー登録機能' do
    context 'ユーザー登録操作をした場合' do
      it 'ユーザー登録が完了し、投稿一覧へ遷移される' do
        visit new_user_registration_path
        fill_in 'ユーザーネーム', with: '田中'
        fill_in 'メールアドレス', with: 'tanaka@tanaka.com'
        fill_in 'パスワード(6文字以上)', with: 'tanaka'
        fill_in '確認用パスワード', with: 'tanaka'
        click_on 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
    end
  end
  describe 'ユーザーログイン機能' do
    context 'ユーザー操作をした場合' do
      it 'ユーザーログインが完了し、投稿一覧へ遷移される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        expect(page).to have_content 'ログインしました。'
      end
    end
    context 'ユーザー登録操作をしない場合' do
      it 'ユーザーがログインせず投稿一覧画面に飛ぼうとしたとき、ログイン画面に遷移する​' do
        visit posts_path
        expect(page).to have_content 'ログインもしくはアカウント登録してください。'
      end
    end
    context 'ログアウト操作を行った場合' do
      it 'ログアウトができる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        click_on 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
    context 'ログイン後、マイページを押した場合' do
      it '自分の詳細画面に飛べる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        click_on 'マイページ'
        expect(page).to have_content 'テスト太郎1'
      end
    end
    context '管理者でログインしている場合' do
      it '管理者画面へアクセスできる' do
        FactoryBot.create(:admin_user)
        visit new_user_session_path
        fill_in 'Email', with: 'admin_user@example.com'
        fill_in 'Password', with: 'passwordadmin'
        click_on 'commit'
        click_on '管理者ログイン'
        expect(page).to have_content 'サイト管理'
      end
    end
  end
end
