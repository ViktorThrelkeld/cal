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
    month1 + space + month2 + space + month3 + space
  end

  def week_header
    week_header = get_month(1).lines.map(&:chomp)
    week_header = week_header[1]
    space = "  "
    week_header + space + week_header + space + week_header + space
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

    week_of_month_1 + space + week_of_month_2 + space + week_of_month_3 + space
  end

  def three_months_of_year(month1, month2, month3)
    first_three_months = []
    first_three_months<<month_header_stringer(month1, month2, month3)
    first_three_months<<week_header
    6.times do |i|
      first_three_months<<week_stringer(month1, month2, month3, i +1)
    end
    first_three_months<<""
  end

  def output_year
    rows = []
    rows<<year_header
    4.times do |i|
      rows<<three_months_of_year((3*i)+1, (3*i)+2, (3*i)+3)
    end
    rows.join("\n")
  end

end