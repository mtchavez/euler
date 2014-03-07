# Problem 10
#
# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

function is_prime(n::Int64)
    if n < 2
        return false
    end
    if n <= 3
        return true
    end
    if (n % 2 == 0 ) || (n % 3 == 0)
        return false
    end
    max_div = sqrt(n)
    div = 5
    while div <= max_div
        if n % div == 0 || n % (div + 2) == 0
            return false
        end
        div += 6
    end
    return true
end

function sum_below(n::Int64)
    sum = 0
    i = 1
    while i <= n
        if is_prime(i)
            sum += i
        end
        i += 1
    end
    return sum
end

println(sum_below(10))
println(sum_below(2000000))
