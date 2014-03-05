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

println(largest_prime(600851475143))
