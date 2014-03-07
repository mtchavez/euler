# Problem 3
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

function largest_prime(n::Int64)
    num = 2
    largest = 1
    while n > 1
        while n % num == 0
            if num > largest
                largest = num
            end
            n = n / num
        end
        num += 1
    end
    return largest
end

println(@time largest_prime(600851475143))
