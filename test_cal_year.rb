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


      # January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa


end