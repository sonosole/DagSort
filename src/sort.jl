export sort_by_bfs
export sort_by_dfs

"""
    sort_by_bfs(rootnode::Cell) -> queue::Vector{Cell}
"""
function sort_by_bfs(entry::Cell)
    @assert isroot(entry) "not a root node"
    sorted = Vector{Cell}()
    queue  = Vector{Cell}()

    push!(queue, entry)
    while notempty(queue)
        cell = popfirst!(queue)
        push!(sorted, cell)
        if haskid(cell)
            for kid in kidsof(cell)
                kid.indegree -= 1
                if kid.indegree == 0
                    push!(queue, kid)
                end
            end
        end
    end

    return sorted
end


"""
    sort_by_bfs(rootnode::Cell) -> stack::Vector{Cell}
"""
function sort_by_dfs(entry::Cell)
    @assert isroot(entry) "not a root node"
    sorted = Vector{Cell}()
    stack  = Vector{Cell}()
    
    push!(stack, entry)
    while notempty(stack)
        cell = pop!(stack)
        push!(sorted, cell)
        if haskid(cell)
            for kid in kidsof(cell)
                kid.indegree -= 1
                if kid.indegree == 0
                    push!(stack, kid)
                end
            end
        end
    end

    return sorted
end