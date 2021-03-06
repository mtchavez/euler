# Problem 2
# Each new term in the Fibonacci sequence is generated by adding the previous two terms.
# By starting with 1 and 2, the first 10 terms will be:
#
# 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
#
# By considering the terms in the Fibonacci sequence whose values do not exceed four
# million, find the sum of the even-valued terms.

function fib(n::Int64)
    a = 0
    b = 1
    c = 0
    total = 0
    if n == 0
        return a
    end
    i = 2
    while i <= n && c <= 4000000
        c = a + b
        if c % 2 == 0
            total += c
        end
        a = b
        b = c
        i += 1
    end
    return total
end

println(@time fib(4000000))
