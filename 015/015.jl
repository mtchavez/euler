# Problem 15
# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

function init(width::Int64)
    return ones(Int64, width+1, width+1)
end

function calc(grid::Array)
    width = size(grid)[1]
    for row = 2:width
        for col = 2:width
            if col == row
                grid[row, col] = grid[row-1, col] * 2
            else
                grid[row, col] = grid[row-1, col] + grid[row, col-1]
            end
        end
    end
    return grid[width^2]
end

println(@time calc(init(20)))
