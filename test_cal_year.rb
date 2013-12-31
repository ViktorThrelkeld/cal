require_relative 'cal_month'
require_relative 'cal_year'
require 'minitest/autorun'

class TestCalYear < MiniTest::Unit::TestCase


  def test_1_year_header_includes_months
    year = Year.new(1996)
    expected = <<EOS
                            1996
      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
EOS
assert_equal( expected.chomp, year.year_header)
  end




end