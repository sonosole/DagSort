include("./graph.jl")

sort_by_bfs(poolgraph())

sort_by_dfs(poolgraph())


for cell in multihead()
    println("===== cells that depends on $(cell.data) =====")
    for c in sort_by_bfs(cell)
        display(c)
    end
    println()
end

for cell in multihead()
    println("===== cells that depends on $(cell.data) =====")
    for c in sort_by_dfs(cell)
        display(c)
    end
    println()
end
