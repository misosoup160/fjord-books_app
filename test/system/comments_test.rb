# frozen_string_literal: true

require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  setup do
    login_as(users(:alice))
  end

  test 'creating a comment with book' do
    visit books_url
    click_on '詳細'
    assert_text '（コメントがありません）'

    fill_in 'comment_content', with: 'とてもいいと思います'
    click_button 'コメントする'
    assert_text 'とてもいいと思います'
    assert_no_text '（コメントがありません）'
  end

  test 'creating a comment with report' do
    visit books_url
    click_on '日報'
    click_on '詳細'
    assert_text '（コメントがありません）'

    fill_in 'comment_content', with: 'とてもいいと思います'
    click_button 'コメントする'
    assert_text 'とてもいいと思います'
    assert_no_text '（コメントがありません）'
  end
end
