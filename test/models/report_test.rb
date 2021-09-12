# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    user = users(:alice)
    
    report = reports(:one)
    assert report.editable?(user)

    report2 = reports(:two)
    assert_not report2.editable?(user)
  end
  
  test '#created_on' do
    report = reports(:one)

    assert report.created_on
    assert_not_equal report.created_at, report.created_on
  end
end
