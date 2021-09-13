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

  # test '#created_on' 修正案1/3
  # test '#created_on' do
  #   report = reports(:one)
  #   report.created_at = '2021-09-10'
  #   assert_equal Date.new(2021, 9, 10), report.created_on
  # end

  # test '#created_on' 修正案2/3
  #   test '#created_on' do
  #   report = reports(:one)
  #   travel_to Time.zone.parse('2021/09/10') do
  #     report.created_at = Time.zone.now
  #     assert_equal Date.today, report.created_on
  #   end
  # end

  # test '#created_on' 修正案3/3
  test '#created_on' do
    report = reports(:one)
    travel_to Time.zone.parse('2021/09/10') do
      report.created_at = Time.zone.now
    end
    assert_equal Date.new(2021, 9, 10), report.created_on
  end
end
