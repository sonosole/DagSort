export indegree
export visit_by_bfs
export visit_by_dfs


function visit_by_bfs(entry::Cell)
    store = Vector{Cell}()
    queue = Vector{Cell}()

    push!(queue, entry)
    setmarked(entry)
    while notempty(queue)
        cell = popfirst!(queue)
        push!(store, cell)
        if haskid(cell)
            for kid in kidsof(cell)
                if !ismarked(kid)
                    push!(queue, kid)  # once pushed,
                    setmarked(kid)     # set marked.
                end
            end
        end
    end

    for cell in store
        unsetmarked(cell)
    end
    return store
end


function visit_by_dfs(entry::Cell)
    store = Vector{Cell}()
    stack = Vector{Cell}()

    push!(stack, entry)
    setmarked(entry)
    while notempty(stack)
        cell = pop!(stack)
        push!(store, cell)
        if haskid(cell)
            for kid in kidsof(cell)
                if !ismarked(kid)
                    push!(stack, kid)  # once pushed,
                    setmarked(kid)     # set marked.
                end
            end
        end
    end

    for cell in store
        unsetmarked(cell)
    end
    return store
end


function indegree(entry::Cell; by::Function=visit_by_dfs)
    cells = by(entry)
    idegree = Dict{Cell,Int}()
    for cell in cells
        push!(idegree, cell => 0)
    end

    # calculate indegree of each cell
    for (cell, ins) in idegree
        if haskid(cell)
            for kid in kidsof(cell)
                idegree[kid] += 1
            end
        end
    end
    return idegree
end
