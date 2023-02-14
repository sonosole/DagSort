include("./graph.jl")

visit_by_bfs(poolgraph())

visit_by_dfs(poolgraph())


for cell in multihead()
    println("===== cells that depends on $(cell.data) =====")
    for c in visit_by_bfs(cell)
        display(c)
    end
    println()
end

for cell in multihead()
    println("===== cells that depends on $(cell.data) =====")
    for c in visit_by_dfs(cell)
        display(c)
    end
    println()
end
