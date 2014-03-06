# encoding: utf-8
# Problem 6
# The sum of the squares of the first ten natural numbers is,
#
# 12 + 22 + ... + 102 = 385
# The square of the sum of the first ten natural numbers is,
#
# (1 + 2 + ... + 10)2 = 552 = 3025
# Hence the difference between the sum of the squares of the first
# ten natural numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one
# hundred natural numbers and the square of the sum.

sums = Hash.new(0)
1.upto(100) { |i| sums['sum_squares'] += i**2; sums['square_sum'] += i }
p((sums['square_sum']**2) - sums['sum_squares'])
