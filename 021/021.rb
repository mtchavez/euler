# encoding: utf-8
# Problem 21
# Let d(n) be defined as the sum of proper divisors of n (numbers less than
# n which divide evenly into n).
# If d(a) = b and d(b) = a, where a != b, then a and b are an amicable pair and
# each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are
# 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110
# therefore d(220) = 284. The proper divisors of 284 are
# 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require 'set'

def divisors(num)
  1.upto(num / 2).select { |n| (num % n).zero? }
end

puts 'Finding amicable numbers under 10,000'
found = Set.new
220.upto(9_999) do |num|
  next if found.include?(num)
  sum = divisors(num).inject(:+)
  sum_div = divisors(sum).inject(:+)
  if sum != num && sum_div == num
    [num, sum].each { |x| found.add(x) }
    puts "Adding [#{num}, #{sum}]"
  end
end

puts found.inject(:+)
