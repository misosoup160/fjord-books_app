# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    alice = users(:alice)
    report = reports(:one)
    assert report.editable?(alice)
  end

  test '#editable? target_user not editable' do
    bob = users(:bob)
    report = reports(:one)
    assert_not report.editable?(bob)
  end

  test '#created_on' do
    report = reports(:one)
    date = Date.new(2021, 1, 26)
    assert_equal(date, report.created_on)
  end
end
