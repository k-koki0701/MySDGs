require 'rails_helper'
RSpec.describe '投稿機能', type: :system do
  before do
    @category = FactoryBot.create(:category2)
    @user = FactoryBot.create(:user)
  end
  describe '投稿新規作成機能' do
    context '投稿を新規作成した場合' do
      it '作成した投稿が表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: 'ゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        expect(page).to have_content 'ゴミ拾いしました！！'
      end
    end
  end
  describe '投稿編集機能' do
    context '自分の投稿詳細画面に遷移し、編集ボタンを押した場合' do
      it '投稿の内容を変更できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: '山でゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        click_on '詳細'
        click_on '編集する'
        fill_in '本文', with: '川でゴミ拾いしました！！'
        click_on '更新する'
        expect(page).to have_content '川でゴミ拾いしました！！'
      end
    end
  end
  describe '投稿詳細機能' do
    context '投稿詳細画面に遷移した場合' do
      it '投稿の内容が表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: 'ゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        click_on '詳細'
        expect(page).to have_content 'コメント'
      end
    end
  end
  describe '投稿削除機能' do
    context '自分の投稿詳細画面に遷移し、削除ボタンを押した場合' do
      it '投稿を削除できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: '山でゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        click_on '詳細'
        click_on '削除する'
        page.accept_alert
        expect(page).to have_content '削除しました！'
      end
    end
  end
  describe '投稿検索機能' do
    context '本文で検索した場合' do
      it '該当の投稿が表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: '山でゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        fill_in 'Search', with: 'ゴミ拾い'
        click_on '検索'
        expect(page).to have_content '山でゴミ拾いしました！！'
      end
    end
    context 'カテゴリーで検索した場合' do
      it '該当の投稿が表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: '山でゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        select '陸の豊かさを守ろう', from: 'q[category_post_category_name_cont]'
        click_on '検索'
        expect(page).to have_content '山でゴミ拾いしました！！'
      end
    end
    context '本文とカテゴリーの両方で検索した場合' do
      it '該当の投稿が表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_post_path
        fill_in 'post_content', with: '山でゴミ拾いしました！！'
        check 'post[category_ids][]'
        attach_file 'post[pictures_attributes][0][image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        fill_in 'Search', with: 'ゴミ拾い'
        select '陸の豊かさを守ろう', from: 'q[category_post_category_name_cont]'
        click_on '検索'
        expect(page).to have_content '山でゴミ拾いしました！！'
      end
    end
  end
end
