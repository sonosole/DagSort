using DagSort
using BenchmarkTools
include("./graph.jl")

"""
    crazy(n::Int, f::Function)
sort_by_dfs is faster than sort_by_bfs

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



function mytest(T::Int, by::Function)
    top = rnngraph(T)
    sortby = by(top)
    return nothing
end


 @btime  mytest(512*100, sort_by_bfs(top));
 @btime  mytest(512*100, sort_by_dfs(top));
