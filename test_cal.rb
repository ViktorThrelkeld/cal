require_relative 'cal_month'
require_relative 'cal_year'
require_relative 'cal'
require 'minitest/autorun'

class TestCal < MiniTest::Unit::TestCase

  def test_1_get_month_i_was_born
    expected = `cal 1 1977`
    shell_output = `ruby cal.rb 1 1977`
    assert_equal(expected, shell_output )
  end

  def test_2_get_year_i_was_born
    expected = `cal 1977`
    assert_equal(expected, `ruby cal.rb 1977`)
  end




end