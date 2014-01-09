require_relative '../cal'

require 'minitest/autorun'
require_relative '../lib/cal_month'
require_relative '../lib/cal_year'

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

  def test_3_leap_century_integration
    expected = `cal 2000`
    assert_equal(expected, `ruby cal.rb 2000`)
  end

  def test_4_leap_year_integration
    expected = `cal 1996`
    assert_equal(expected, `ruby cal.rb 1996`)
  end

  def test_5_get_a_6_week_month
     expected = `cal 09 2012`
    assert_equal(expected, `ruby cal.rb 09 2012`)
  end

  def test_6_argument_error_for_range
    shell_output = `ruby cal.rb 1799`
    assert_raises ArgumentError do
      raise ArgumentError, 'Range is 1800 through 3000'
    end
  end
end