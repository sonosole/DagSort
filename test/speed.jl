using DagSort
using BenchmarkTools

"""
    crazy(n, f::Function)

julia> @btime crazy(100_000, sort_by_bfs)
  32.579 ms (500014 allocations: 28.53 MiB)

julia> @btime crazy(100_000, sort_by_dfs)
  31.925 ms (500014 allocations: 28.53 MiB)
"""
function crazy(n::Int, f::Function)
    nodes = Vector{Cell}(undef, n)
    for i = 1:n
        nodes[i] = Cell("$i")
    end
    for i = 1:n-1
        addkid(nodes[i], nodes[i+1])
    end
    f(nodes[1]);
    return nothing
end

count = 100_000
@btime crazy(count, sort_by_bfs)
@btime crazy(count, sort_by_dfs)
