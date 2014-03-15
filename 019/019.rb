# encoding: utf-8
#
# Problem 19

MONTH_DAYS = {
  1 => 31, 2 => 28, 3 => 31, 4 => 30,
  5 => 31, 6 => 30, 7 => 31, 8 => 31,
  9 => 30, 10 => 31, 11 => 30, 12 => 31
}

def leap_year?(year)
  year % 4 == 0 || year % 400 == 0
end

def count_sundays
  day_count = 0
  start_day = 2
  year_sundays = Hash.new 0
  1901.upto(2000).each do |year|
    start_day_offset = 1
    if leap_year?(year)
      start_day_offset += 1
      days = (start_day == 0 || start_day == 6) ? 53 : 52
    else
      days = start_day == 0 ? 53 : 52
    end
    day_count += days
    next_start = start_day + start_day_offset
    start_day = next_start > 6 ? next_start - 7 : next_start
    year_sundays[year.to_s] = days
  end
  return year_sundays, day_count
end

puts count_sundays

start_day = 2
day_of_week = 2
total = 0
1901.upto(2000).each do |year|
  1.upto(12) do |month|
    days = MONTH_DAYS[month]
    days += 1 if month == 2 && leap_year?(year)
    total += 1 if day_of_week == 0
    next_start = day_of_week + (days % 7)
    day_of_week = next_start > 6 ? next_start - 7 : next_start
  end
end

puts total
