class Month
  def initialize(month, year)
    @month = month
    @year = year
  end

  def header
    months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}
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
    @day_one = day_one
  end

  def days_in_month
    m = {1 => 31, 2 => 28, 3 => 31, 4 => 31, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
    days_in_month = "#{m[@month]}"
    days_in_month.to_i
    (1..(days_in_month.to_i)).to_a
  end


  def first_day_of_month
    #{0 => "sa", 1 => "su", 2 => "mo", 3 => "tu" 4=> "we", 5 => "th", 6 => "fr"}
    spaces = {1 => " ", 2 => "   ", 3 => "     "}
  end

end
























# if @month == 1 || @month == 2
    #   m = @month +12
    #   y = @year - 1
    # else
    #   m = @month
    #   y = @year
    # end