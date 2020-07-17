module JuliaTutorial

export myupdate!, myparallelupdate!, fib, fibparallel

function myupdate!(y, x)
    for i in eachindex(y)
        y[i] += sin(x[i])
    end
end

function myparallelupdate!(y, x)
    Threads.@threads for i in eachindex(y)
        y[i] += sin(x[i])
    end
end

function fib(x)
    if x == 1 || x == 2
        return one(x)
    else
        fib(x-1) + fib(x-2)
    end
end

function fibparallel(x)
    if x == 1 || x == 2
        return one(x)
    else
        fib_minus_one = Threads.@spawn fibparallel(x-2)
        return fibparallel(x-1) + fetch(fib_minus_one)
    end
end


end # module
