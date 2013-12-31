require_relative 'cal_month'
require_relative 'cal_year'
require 'minitest/autorun'

class TestCalYear < MiniTest::Unit::TestCase

  def test_1_year_header
    year = Year.new(1977)
    expected = <<EOS
                            1977
EOS
assert_equal( expected.chomp, year.year_header)
  end

  def test_2_year_header_includes_months
    year = Year.new(1996)
    expected = <<EOS
                            1996

EOS
assert_equal( expected.chomp, year.year_header)

  end




end