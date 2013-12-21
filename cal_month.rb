class Month
  def initialize(month, year)
    @month = month
    @year = year
  end

  def header
    months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July"}
    string = "#{months[@month]} #{@year}".center(20).rstrip
    string + "\nSu Mo Tu We Th Fr Sa"
  end
  def zeller
    m = @month
    y = @year
    if m == 1 or m == 2
      m += 12
      y -= 1
    end
    day_one =(1 + (((m + 1) * 26) / 10) + y + (y / 4) + 6 * (y / 100) + (y / 400)) % 7
  end

# below is from interwebs
  # def zeller(year, month, day)
  #     months = %w[march april may june july august september october november december january february]
  #     weekdays = %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
  #     k = day
  #     m = months.index(month.downcase) + 1
  #     y = (m <= 10) ? year : year-1
  #     d = y % 100
  #     c = y / 100
  #     f = (k + (((13*m) - 1) / 5).floor + d + (d/4).floor + (c/4).floor - (2*c)) % 7
  #     weekdays[f]
  # end

  # 1800.upto(3000) do |y|
  #     puts "Five Friday, Saturday, and Sundays for October, #{y}" if zeller(y, "october", 1) == "Friday"
  # end


end
























# if @month == 1 || @month == 2
    #   m = @month +12
    #   y = @year - 1
    # else
    #   m = @month
    #   y = @year
    # end