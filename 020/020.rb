# encoding: utf-8
# Problem 20
# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
# and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

def fac(num)
  return num if num <= 1
  num * fac(num - 1)
end

puts fac(10)
puts fac(10).to_s.split('').map(&:to_i).inject(:+)
puts fac(100).to_s.split('').map(&:to_i).inject(:+)
