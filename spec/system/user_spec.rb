require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  describe 'ユーザ登録機能' do
    context 'ユーザ登録操作をした場合' do
      it 'ユーザ登録が完了し、ユーザ詳細画面へ遷移される' do
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
end
