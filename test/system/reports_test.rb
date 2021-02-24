# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:alice))
  end

  test 'visiting the index' do
    visit books_url
    click_on '日報'
    assert_selector 'h1', text: '日報'
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

  test 'destroying a Report' do
    report = reports(:one)
    visit reports_url
    assert_text report.title
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました'
    assert_no_text report.title
  end
end
