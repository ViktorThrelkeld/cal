require_relative 'cal_month'
require 'minitest/autorun'

class TestCalMonth < MiniTest::Unit::TestCase

  def test_cal_month_has_zellers_method
    Month.zellers("1")
  end



end