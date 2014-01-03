require_relative 'cal_month'

class Year
def initialize(year)
    @year = year
  end

  def year_header
    year_head = "#{@year}".center(60).rstrip
  end

  def get_month(month_num)
    month = Month.new(month_num, @year)
    month.output_month
  end

  def month_header(num)
    month = get_month(num).lines.map(&:chomp)
    month = month[0].split(" ")
    month = month[0].center(20)
  end

  def month_stringer(month_1, month_2, month_3)
    month1 = month_header(month_1)
    month2 = month_header(month_2)
    month3 = month_header(month_3)
    space = "  "
    month1 + space + month2 + space + month3
  end

  def week_header
    week_header = get_month(1).lines.map(&:chomp)
    week_header = week_header[1]
    space = "  "
    week_header + space + week_header + space + week_header
  end

  def week_1(month_num)
    week_1 = get_month(month_num).lines.map(&:chomp)
    week_1 = week_1[2]
    # month1_week1 = get_month(1).lines.map(&:chomp)
    # month1_week1 = month1_week1[2]
    # month2_week1 = get_month(2).lines.map(&:chomp)
    # month2_week1 = month2_week1[2]
    # month3_week1 = get_month(3).lines.map(&:chomp)
    # month3_week1 = month3_week1[2]
    # space = "  "
    # month1_week1 + space + month2_week1 + space + month3_week1
  end

  def week_1_stringer(month_1, month_2, month_3)
    week_1_month_1 = week_1(month_1)
    week_1_month_2 = week_1(month_2)
    week_1_month_3 = week_1(month_3)
    space = "  "
    week_1_month_1 + space + week_1_month_2 + space + week_1_month_3
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