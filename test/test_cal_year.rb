require_relative '../lib/cal_month'
require_relative '../lib/cal_year'
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

  def test_4_string_first_three_month_header
    year = Year.new(1996)
    expected =
  "      January               February               March          "
  assert_equal(expected.chomp, year.month_header_stringer(1,2,3))
  end

  def test_4_a_string_second_three_months_header
        year = Year.new(1996)
        expected =
  "       April                  May                   June          "
  assert_equal(expected.chomp, year.month_header_stringer(4,5,6))
end


  def test_5_string_week_header
    year = Year.new(1996)
    expected =
  "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  "
  assert_equal(expected.chomp, year.week_header)
  end

  def test_6_string_first_3_months_week_1
    year = Year.new(1996)
    expected =
  "    1  2  3  4  5  6               1  2  3                  1  2  "
  assert_equal(expected.chomp, year.week_stringer(1, 2, 3, 1))
  end

  def test_7_string_second_3_months_week_4
    year = Year.new(1996)
    expected =
    "21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22  "
    assert_equal(expected.chomp, year.week_stringer(4, 5, 6, 4))
  end

  def test_8_string_second_3_months_week_5
    year = Year.new(1996)
    expected =
    "28 29 30              26 27 28 29 30 31     23 24 25 26 27 28 29  "
    assert_equal(expected.chomp, year.week_stringer(4, 5, 6, 5))
  end

  def test_9_string_second_3_months_week_6
    year = Year.new(1996)
    expected =
    "                                            30                    "
    assert_equal(expected.chomp, year.week_stringer(4, 5, 6, 6))
  end

  def test_10_string_third_3_months_week_6
    year = Year.new(1996)
    expected =
    "                                                                  "
    assert_equal(expected.chomp, year.week_stringer(7, 8, 9, 6))
  end

  def test_11_print_year
    year = Year.new(2000)
    expected = <<EOS
                            2000
      January               February               March          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                   1         1  2  3  4  5            1  2  3  4  
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   5  6  7  8  9 10 11  
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  12 13 14 15 16 17 18  
16 17 18 19 20 21 22  20 21 22 23 24 25 26  19 20 21 22 23 24 25  
23 24 25 26 27 28 29  27 28 29              26 27 28 29 30 31     
30 31                                                             

       April                  May                   June          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                   1      1  2  3  4  5  6               1  2  3  
 2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10  
 9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17  
16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24  
23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30     
30                                                                

        July                 August              September        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
                   1         1  2  3  4  5                  1  2  
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9  
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16  
16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23  
23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30  
30 31                                                             

      October               November              December        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
 1  2  3  4  5  6  7            1  2  3  4                  1  2  
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9  
15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16  
22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23  
29 30 31              26 27 28 29 30        24 25 26 27 28 29 30  
                                            31                    
EOS
    assert_equal(expected, year.output_year)
  end

  def test_12_print_year
      year = Year.new(1996)
      expected = <<EOS
                            1996
      January               February               March          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6               1  2  3                  1  2  
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   3  4  5  6  7  8  9  
14 15 16 17 18 19 20  11 12 13 14 15 16 17  10 11 12 13 14 15 16  
21 22 23 24 25 26 27  18 19 20 21 22 23 24  17 18 19 20 21 22 23  
28 29 30 31           25 26 27 28 29        24 25 26 27 28 29 30  
                                            31                    

       April                  May                   June          
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6            1  2  3  4                     1  
 7  8  9 10 11 12 13   5  6  7  8  9 10 11   2  3  4  5  6  7  8  
14 15 16 17 18 19 20  12 13 14 15 16 17 18   9 10 11 12 13 14 15  
21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22  
28 29 30              26 27 28 29 30 31     23 24 25 26 27 28 29  
                                            30                    

        July                 August              September        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
    1  2  3  4  5  6               1  2  3   1  2  3  4  5  6  7  
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   8  9 10 11 12 13 14  
14 15 16 17 18 19 20  11 12 13 14 15 16 17  15 16 17 18 19 20 21  
21 22 23 24 25 26 27  18 19 20 21 22 23 24  22 23 24 25 26 27 28  
28 29 30 31           25 26 27 28 29 30 31  29 30                 
                                                                  

      October               November              December        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  
       1  2  3  4  5                  1  2   1  2  3  4  5  6  7  
 6  7  8  9 10 11 12   3  4  5  6  7  8  9   8  9 10 11 12 13 14  
13 14 15 16 17 18 19  10 11 12 13 14 15 16  15 16 17 18 19 20 21  
20 21 22 23 24 25 26  17 18 19 20 21 22 23  22 23 24 25 26 27 28  
27 28 29 30 31        24 25 26 27 28 29 30  29 30 31              
                                                                  
EOS
  assert_equal(expected, year.output_year)
    end
end












#                             1996
#       January               February               March
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6               1  2  3                  1  2
#  7  8  9 10 11 12 13   4  5  6  7  8  9 10   3  4  5  6  7  8  9
# 14 15 16 17 18 19 20  11 12 13 14 15 16 17  10 11 12 13 14 15 16
# 21 22 23 24 25 26 27  18 19 20 21 22 23 24  17 18 19 20 21 22 23
# 28 29 30 31           25 26 27 28 29        24 25 26 27 28 29 30
#                                             31

#        April                  May                   June
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6            1  2  3  4                     1
#  7  8  9 10 11 12 13   5  6  7  8  9 10 11   2  3  4  5  6  7  8
# 14 15 16 17 18 19 20  12 13 14 15 16 17 18   9 10 11 12 13 14 15
# 21 22 23 24 25 26 27  19 20 21 22 23 24 25  16 17 18 19 20 21 22
# 28 29 30              26 27 28 29 30 31     23 24 25 26 27 28 29
#                                             30

#         July                 August              September
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#     1  2  3  4  5  6               1  2  3   1  2  3  4  5  6  7
#  7  8  9 10 11 12 13   4  5  6  7  8  9 10   8  9 10 11 12 13 14
# 14 15 16 17 18 19 20  11 12 13 14 15 16 17  15 16 17 18 19 20 21
# 21 22 23 24 25 26 27  18 19 20 21 22 23 24  22 23 24 25 26 27 28
# 28 29 30 31           25 26 27 28 29 30 31  29 30


#       October               November              December
# Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
#        1  2  3  4  5                  1  2   1  2  3  4  5  6  7
#  6  7  8  9 10 11 12   3  4  5  6  7  8  9   8  9 10 11 12 13 14
# 13 14 15 16 17 18 19  10 11 12 13 14 15 16  15 16 17 18 19 20 21
# 20 21 22 23 24 25 26  17 18 19 20 21 22 23  22 23 24 25 26 27 28
# 27 28 29 30 31        24 25 26 27 28 29 30  29 30 31
