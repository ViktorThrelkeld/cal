require_relative 'cal_month'
require_relative 'cal_year'

if ARGV.length == 2
  month = Month.new(ARGV[0].to_i, ARGV[1].to_i)
  month = month.output_month
  month = month.split(/\n/)
  month = month.map{|line| line.ljust(22)}
  month = month.join("\n")
  puts month
end

if ARGV.length == 1
  year = Year.new(ARGV[0].to_i)
  year = year.year_constructer

  puts year #this is printing out all that crap at the top
end
