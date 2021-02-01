# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)

    visit root_url
    fill_in 'Eメール', with: 'alice@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit books_url
    click_on '日報'
    assert_selector 'h1', text: '日報'
    assert_text 'タイトルA'
    assert_text 'alice'
    assert_text '2021/01/26'
    assert_text '詳細'
    assert_text '編集'
    assert_text '削除'
  end

  test 'creating a Report' do
    visit reports_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'タイトルB'
    fill_in '内容', with: '内容B'
    click_on '登録する'

    assert_text '日報が作成されました'
    assert_text 'タイトルB'
    assert_text '内容B'
    assert_text 'alice'
    click_on '戻る'
    assert_text 'タイトルB'
  end

  test 'updating a Report' do
    visit reports_url
    click_on '編集'

    fill_in 'タイトル', with: 'タイトルC'
    fill_in '内容', with: '内容C'
    click_on '更新する'

    assert_text '日報が更新されました'
    assert_text 'タイトルC'
    assert_text '内容C'
    click_on '戻る'
    assert_text 'タイトルC'
  end

  test 'destroying a Book' do
    visit reports_url
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました'
  end
end
