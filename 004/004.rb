# encoding: utf-8
# A palindromic number reads the same both ways.
# The largest palindrome made from the product of two 2-digit
# numbers is 9009 as 91 by 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

max = 999
largest = 0

def palindrome?(num)
  num.to_s == num.to_s.reverse
end

0.upto(max) do |x|
  x.upto(max) do |y|
    prod = x * y
    largest = prod if palindrome?(prod) && prod > largest
  end
end

p largest
