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