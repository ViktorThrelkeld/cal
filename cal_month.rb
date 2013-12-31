
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
    day_one
  end

  def days_in_month
    if @month == 2 and (@year % 400 == 0 or (@year % 4 == 0 and @year % 100 != 0))
      (1..29).to_a
    else
      m = {1 => 31, 2 => 28, 3 => 31, 4 => 31, 5 => 31, 6 => 30, 7 => 31, 8 => 31, 9 => 30, 10 => 31, 11 => 30, 12 => 31}
      days = m[@month]
      r = (1..days).to_a
    end
  end

  def first_day_of_month
    spaces = {1 => "", 2 => "   ", 3 => "      ", 4 => "         ", 5 => "            ", 6 => "               ", 0 => "                  "}
    zeller
    spaces[zeller]
  end

  def spacing
    days = days_in_month
    days = days.map do |day|
      if day < 10
        " " + day.to_s
      else
        day
      end
    end
    days = days.join(" ")
  end

  def line_break
    days = first_day_of_month + spacing
    days = days.scan(/.{1,21}/)
    days = days.map{|days| days.rstrip}
    days.join("\n")
  end

  def output_month
    header.rstrip + "\n" + line_break
  end
end
























# if @month == 1 || @month == 2
    #   m = @month +12
    #   y = @year - 1
    # else
    #   m = @month
    #   y = @year
    # end