#Problem 7
#By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
#What is the 10 001st prime number?

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

function get_primes(total::Int64)
    count = 0
    num = 1
    while count < total
        if is_prime(num)
            count += 1
        end
        num += 1
    end
    return num - 1
end

println(get_primes(10001))
