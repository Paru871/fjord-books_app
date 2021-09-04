# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    @report = reports(:one)
    visit root_url
    @user = users(:alice)
    # sign_in(@user)
    fill_in 'Eメール', with: @user.email
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test 'visiting the index' do
    visit reports_url

    assert_selector 'h1', text: '日報'
  end

  test '#creating_a_report' do
    visit reports_path

    click_on '新規作成'

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content

    click_on '登録する'

    assert_text '日報が作成されました。'
    click_on '戻る'
  end

  test '#updating_a_report' do
    visit reports_path
    click_on '編集', match: :first, exact: true

    fill_in 'タイトル', with: @report.title
    fill_in '内容', with: @report.content
    click_on '更新する'

    assert_text '日報が更新されました。'
    click_on '戻る'
  end

  test '#destroying_a_report' do
    visit reports_path
    page.accept_confirm do
      click_on '削除', match: :first
    end

    assert_text '日報が削除されました。'
  end
end
