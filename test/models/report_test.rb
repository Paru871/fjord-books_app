# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#created_on' do
    # me = User.create!(email: 'me@example.com', password: 'password')
    @user = users(:alice)

    report = Report.create!(user: @user, title: 'title', content: 'content')

    assert_not_equal report.created_at.class, Date
    assert_equal report.created_on.class, Date
  end
end
