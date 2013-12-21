require_relative 'cal_month'
require 'minitest/autorun'

class TestCalMonth < MiniTest::Unit::TestCase

  def test_month_has_zellers_method
    month = Month.new(1, 2000)
    month.zeller
  end

  def test_1_month_and_year_header
    month = Month.new(1, 2012)
    expected = <<EOS
    January 2012
Su Mo Tu We Th Fr Sa
EOS
  assert_equal(expected.chomp, month.header)
  end

  def test_2_month_and_year_header_feb
    month = Month.new(2, 2000)
    expected = <<EOS
   February 2000
Su Mo Tu We Th Fr Sa
EOS
  assert_equal(expected.chomp, month.header)
  end

  def test_3_zeller_on_monday
    month = Month.new(5, 2000)
    assert_equal(2, month.zeller)
  end

  def test_4_zeller_on_sun
    month = Month.new(7, 2012)
    assert_equal(1, month.zeller)
  end

  def test_5_zeller_on_jan
    month = Month.new(1, 2000)
    assert_equal(0, month.zeller)
  end

  def test_6_zeller_on_feb
    month = Month.new(2, 2013)
    assert_equal(6, month.zeller)
  end


end