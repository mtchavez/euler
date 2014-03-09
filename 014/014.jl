# Problem 14
# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
# It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

function next_collatz(n::Int64)
    if n % 2 == 0
        return convert(Int64, n / 2)
    else
        return (3 * n) + 1
    end
end

function collatz_chain(n::Int64, total::Int64)
    if n == 1
        total += 1
        return total
    end
    collatz_chain(next_collatz(n), total+1)
end

function find_longest()
    longest = 0
    num = 0
    for i = 1:1000000
        chain = collatz_chain(i, 0)
        if chain > longest
            num = i
            longest = chain
        end
    end
    return num, longest
end

println(@time collatz_chain(13,0))
println(@time find_longest())
