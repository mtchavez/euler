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

println(fib(4000000))
