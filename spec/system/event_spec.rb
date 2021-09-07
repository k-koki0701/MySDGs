require 'rails_helper'
RSpec.describe 'イベント機能', type: :system do
  before do
    @category = FactoryBot.create(:category2)
    @user = FactoryBot.create(:user)
  end
  describe 'イベント新規作成機能' do
    context 'イベントを新規作成した場合' do
      it '作成したイベントが表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_event_path
        fill_in 'event_title', with: 'ゴミ拾い'
        fill_in 'event_content', with: '新宿駅周辺を掃除しましょう！！'
        select '陸の豊かさを守ろう', from: 'event[category_id]'
        fill_in 'event_schedule', with: DateTime.now.since(1.day)
        attach_file 'event[image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        expect(page).to have_content 'ゴミ拾い'
      end
    end
  end
  describe 'イベント編集機能' do
    context '自分のイベント詳細画面に遷移し、編集ボタンを押した場合' do
      it 'イベントの内容を変更できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_event_path
        fill_in 'event_title', with: 'ゴミ拾い'
        fill_in 'event_content', with: '新宿駅周辺を掃除しましょう！！'
        select '陸の豊かさを守ろう', from: 'event[category_id]'
        fill_in 'event_schedule', with: DateTime.now.since(1.day)
        attach_file 'event[image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        expect(page).to have_content 'ゴミ拾い'
        click_on '詳細'
        click_on '編集する'
        fill_in 'event_title', with: 'ゴミ拾い！！'
        click_on '更新する'
        expect(page).to have_content 'ゴミ拾い！！'
      end
    end
  end
  describe 'イベント詳細機能' do
    context 'イベント詳細画面に遷移した場合' do
      it 'イベントの内容が表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_event_path
        fill_in 'event_title', with: 'ゴミ拾い'
        fill_in 'event_content', with: '新宿駅周辺を掃除しましょう！！'
        select '陸の豊かさを守ろう', from: 'event[category_id]'
        fill_in 'event_schedule', with: DateTime.now.since(1.day)
        attach_file 'event[image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        sleep(1)
        click_on '詳細'
        expect(page).to have_content '編集する'
      end
    end
  end
  describe 'イベント削除機能' do
    context '自分のイベント詳細画面に遷移し、削除ボタンを押した場合' do
      it 'イベントを削除できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_event_path
        fill_in 'event_title', with: 'ゴミ拾い'
        fill_in 'event_content', with: '新宿駅周辺を掃除しましょう！！'
        select '陸の豊かさを守ろう', from: 'event[category_id]'
        fill_in 'event_schedule', with: DateTime.now.since(1.day)
        attach_file 'event[image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        click_on '詳細'
        click_on '削除する'
        page.accept_alert
        expect(page).to have_content '削除しました！'
      end
    end
  end
  describe 'イベント検索機能' do
    context 'タイトルで検索した場合' do
      it '該当のイベントが表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_event_path
        fill_in 'event_title', with: 'ゴミ拾い'
        fill_in 'event_content', with: '新宿駅周辺を掃除しましょう！！'
        select '陸の豊かさを守ろう', from: 'event[category_id]'
        fill_in 'event_schedule', with: DateTime.now.since(1.day)
        attach_file 'event[image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        fill_in 'イベントを調べる', with: 'ゴミ拾い'
        click_on '検索'
        expect(page).to have_content 'ゴミ拾い'
      end
    end
    context 'カテゴリーで検索した場合' do
      it '該当のイベントが表示される' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit new_event_path
        sleep(1)
        fill_in 'event_title', with: 'ゴミ拾い'
        fill_in 'event_content', with: '新宿駅周辺を掃除しましょう！！'
        select '陸の豊かさを守ろう', from: 'event[category_id]'
        fill_in 'event_schedule', with: DateTime.now.since(1.day)
        attach_file 'event[image]', "#{Rails.root}/spec/fixtures/test_image1.jpg"
        click_on '登録する'
        sleep(1)
        select '陸の豊かさを守ろう', from: 'q_category_name_cont'
        click_on '検索'
        expect(page).to have_content 'ゴミ拾い'
      end
    end
  end
  describe 'イベント参加機能' do
    before do
      @event = FactoryBot.create(:event)
    end
    context 'イベント詳細画面で参加するを押した場合' do
      it 'イベントに参加できる' do
        visit new_user_session_path
        fill_in 'Email', with: 'test1@example.com'
        fill_in 'Password', with: 'password1'
        click_on 'commit'
        visit events_path
        click_on '詳細'
        click_on '参加する'
        page.accept_alert
        expect(page).to have_content '参加をやめる'
      end
    end
  end
end
