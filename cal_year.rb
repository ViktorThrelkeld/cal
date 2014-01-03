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

  def month_header_stringer(month_1, month_2, month_3)
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
  end

  def week_1_stringer(month_1, month_2, month_3)
    week_1_month_1 = week_1(month_1)
    week_1_month_2 = week_1(month_2)
    week_1_month_3 = week_1(month_3)
    space = "  "
    week_1_month_1 + space + week_1_month_2 + space + week_1_month_3
  end

end