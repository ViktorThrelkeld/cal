require_relative 'cal_month'
require_relative 'cal_year'
require 'minitest/autorun'

class TestCalYear < MiniTest::Unit::TestCase


  def test_1_year_header
    year = Year.new(1996)
    expected = <<EOS
                            1996
EOS
  assert_equal(expected.chomp, year.year_header)
  end

  def test_2_years_first_month
    year = Year.new(1996)
    expected = <<EOS
    January 1996
Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29 30 31
EOS
  assert_equal(expected.chomp, year.get_month(1))
  end

  def test_3_years_second_month
    year = Year.new(1996)
    expected = <<EOS
   February 1996
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28 29
EOS
    assert_equal(expected.chomp, year.get_month(2))
  end

  def test_4_string_first_three_month_headers
    year = Year.new(1996)
    expected =
  "      January               February               March        "
  assert_equal(expected.chomp, year.month_header_stringer(1,2,3))
  end

  def test_4_a_string_second_three_months
        year = Year.new(1996)
        expected =
  "       April                  May                   June        "
  assert_equal(expected.chomp, year.month_header_stringer(4,5,6))
end


  def test_5_string_week_header
    year = Year.new(1996)
    expected =
  "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
  assert_equal(expected.chomp, year.week_header)
  end

  def test_6_string_first_3_months_week_1
    year = Year.new(1996)
    expected =
  "    1  2  3  4  5  6               1  2  3                  1  2"
  assert_equal(expected.chomp, year.week_stringer(1, 2, 3, 1))
  end

  def test_7_string_second_3_months_week_4
    year = Year.new(1996)
    expected =
    "21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22"
    assert_equal(expected.chomp, year.week_stringer(4, 5, 6, 4))
  end





end