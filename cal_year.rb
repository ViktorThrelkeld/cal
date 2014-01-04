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
    month3 = month3.rstrip
    space = "  "
    month1 + space + month2 + space + month3
  end

  def week_header
    week_header = get_month(1).lines.map(&:chomp)
    week_header = week_header[1]
    space = "  "
    week_header + space + week_header + space + week_header
  end

  def week(month_num, week_number)
    index_week_number = week_number + 1
    week = get_month(month_num).lines.map(&:chomp)
    week = week[index_week_number]
  end

  def week_stringer(month_1, month_2, month_3, week_number)
    week_of_month_1 = week(month_1, week_number)
    week_of_month_2 = week(month_2, week_number)
    week_of_month_3 = week(month_3, week_number)

    if week_of_month_1 == nil
      week_of_month_1 = "                    "
    end
    if week_of_month_2 == nil
      week_of_month_2 = "                    "
    end
    if week_of_month_3 == nil
      week_of_month_3 = "                    "
    end
    week_of_month_1 = week_of_month_1.ljust(20)
    week_of_month_2 = week_of_month_2.ljust(20)
    week_of_month_3 = week_of_month_3.ljust(20)
    space = "  "

    week_of_month_1 + space + week_of_month_2 + space + week_of_month_3
  end

  def year_constructer
    rows = []
    rows<<year_header
    rows<<month_header_stringer(1,2,3)
    rows<<week_header

    rows<<week_stringer(1,2,3,1)
    rows<<week_stringer(1,2,3,2)
    rows<<week_stringer(1,2,3,3)
    rows<<week_stringer(1,2,3,4)
    rows<<week_stringer(1,2,3,5).rstrip
    rows<<week_stringer(1,2,3,6).rstrip
    rows<<"\n"
    rows.join("\n")
  end

end