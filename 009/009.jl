# Problem 9
#A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
#
# a2 + b2 = c2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
#
# Euclids Formula:  a = m^2 - n^2,  b = 2mn ,c = m^2 + n^2

function find_sum_equal(num::Int)
    for n = 1:1000000
        for m = n+1:n+40001
            csquared = n^2 + m^2
            c = csquared^0.5
            if n + m + c == num
                return n, m, c
            end
        end
    end
end


println(find_sum_equal(1000))
