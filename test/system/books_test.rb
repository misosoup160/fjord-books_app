# frozen_string_literal: true

require 'application_system_test_case'

class BooksTest < ApplicationSystemTestCase
  setup do
    login_as(users(:alice))
  end

  test 'visiting the index' do
    visit books_url
    assert_selector 'h1', text: '本'
  end

  test 'creating a Book' do
    visit books_url
    click_on '新規作成'

    fill_in 'タイトル', with: 'Ruby超入門'
    fill_in 'メモ', with: 'すごくわかりやすい！！'
    fill_in '著者', with: 'igaiga'
    click_on '登録する'

    assert_text '本が作成されました'
    assert_text 'Ruby超入門'
    assert_text 'すごくわかりやすい！！'
    assert_text 'igaiga'
  end

  test 'updating a Book' do
    visit books_url
    click_on '編集'

    fill_in 'タイトル', with: '楽々ERDレッスン'
    fill_in 'メモ', with: '画期的な本！！'
    fill_in '著者', with: '羽生 章洋'
    click_on '更新する'

    assert_text '本が更新されました'
    assert_text '楽々ERDレッスン'
    assert_text '画期的な本！！'
    assert_text '羽生 章洋'
  end

  test 'destroying a Book' do
    book = books(:cherry_book)
    visit books_url
    assert_text book.title
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '本が削除されました'
    assert_no_text book.title
  end
end
