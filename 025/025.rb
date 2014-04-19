# encoding: utf-8
#
# Problem 25
# The Fibonacci sequence is defined by the recurrence relation:
#
# Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
# Hence the first 12 terms will be:
#
# F1 = 1
# F2 = 1
# F3 = 2
# F4 = 3
# F5 = 5
# F6 = 8
# F7 = 13
# F8 = 21
# F9 = 34
# F10 = 55
# F11 = 89
# F12 = 144
# The 12th term, F12, is the first term to contain three digits.
#
# What is the first term in the Fibonacci sequence to contain 1000 digits?

def sum(a, b)
  larger, smaller = a.length >= b.length ? [a.reverse, b.reverse] : [b.reverse, a.reverse]
  remainder = 0
  total = ''
  larger.split('').each_with_index do |x, i|
    add = x.to_i + smaller[i].to_i + remainder
    if i == larger.length - 1
      total += add.to_s.reverse
    else
      total += (add % 10).to_s
      remainder = add >= 10 ? 1 : 0
    end
  end
  total.reverse
end

sum '8234', '9234'

def fib(digits = 3)
  a, b, c = '0', '1', '0'
  i = 1
  while c.length < digits
    c = sum(a, b)
    a, b = b, c
    i += 1
  end
  puts "Fib #{i} is first to have #{digits} digits: #{c}"
end

fib(3)
fib(5)
fib(6)
fib(1_000)
