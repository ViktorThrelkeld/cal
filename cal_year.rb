require_relative 'cal_month'

class Year
def initialize(year)
    @year = year
  end

  def year_header
    year_head = "#{@year}".center(60).rstrip
  end

  def get_month(num)
    month = Month.new(num, @year)
    month.output_month
  end
  def month_header_1
    month1 = get_month(1).lines.map(&:chomp)
    month1 = month1[0].split(" ")
    month1 = month1[0].center(20)
    month2 = get_month(2).lines.map(&:chomp)
    month2 = month2[0].split(" ")
    month2 = month2[0].center(20)
    month3 = get_month(3).lines.map(&:chomp)
    month3 = month3[0].split(" ")
    month3 = month3[0].center(20)
    space = "  "
    month1 + space + month2 + space + month3
  end

  def week_header
    week_header = get_month(1).lines.map(&:chomp)
    week_header = week_header[1]
    space = "  "
    week_header + space + week_header + space + week_header
  end





    # months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}
    # months_row1 = "\n" + "#{months[1]}".center(20) + "  " + "#{months[2]}".center(20) + "  " + "#{months[3]}".center(20).rstrip
    # @weekdays = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa"
    # year_head + months_row1 + "\n" + @weekdays



  # def month_headers(*num)
  #   months_hash = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}
  #   months = num.map{|num| "#{months[num]}".center(20)}
  #   months.join("  ")
  # end
end