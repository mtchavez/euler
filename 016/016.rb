# encoding: utf-8
# Problem 16
# 215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
#
# What is the sum of the digits of the number 21000?

def sum_base_2_number(pow = 1)
  (2**pow).to_s.split('').map(&:to_i).inject(:+)
end

puts sum_base_2_number(15)
puts sum_base_2_number(1000)
