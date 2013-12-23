require_relative 'cal_month'
require 'minitest/autorun'

class TestCalMonth < MiniTest::Unit::TestCase

  def test_1_month_has_zellers_method
    month = Month.new(1, 2000)
    month.zeller
  end

  def test_2_month_and_year_header
    month = Month.new(1, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
EOS
  assert_equal(expected.chomp, month.header)
  end

  def test_3_month_and_year_header_feb
    month = Month.new(2, 2000)
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
EOS
  assert_equal(expected.chomp, month.header)
  end

  def test_4_zeller_on_monday
    month = Month.new(5, 2000)
    assert_equal(2, month.zeller)
  end

  def test_5_zeller_on_sun
    month = Month.new(7, 2012)
    assert_equal(1, month.zeller)
  end

  def test_6_zeller_on_jan
    month = Month.new(1, 2000)
    assert_equal(0, month.zeller)
  end

  def test_7_zeller_on_feb
    month = Month.new(2, 2013)
    assert_equal(6, month.zeller)
  end

  def test_8_method_days_in_month_exists
    month = Month.new(1, 2000)
    month.days_in_month
  end

  def test_9_days_in_month_on_jan
    month = Month.new(1, 2000)
    assert_equal(31, month.days_in_month)
  end

  def test_10_days_in_month_on_sept
    month = Month.new(9, 2000)
    assert_equal(30, month.days_in_month)
  end

  def test_11_first_day_of_month_exists
    month = Month.new(9, 2000)
    month.first_day_of_month
  end

  def test_12_first_day_of_month_on_sept
    # month = Month.new(9, 2013)
    # assert_equal(, month.first_day_of_month)
  end


end