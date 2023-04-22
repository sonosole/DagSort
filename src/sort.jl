export sort_by_bfs
export sort_by_dfs
export level_sort_by_bfs
export level_sort_by_dfs


"""
    sort_by_bfs(entry::Cell) -> sorted::Vector{Cell}
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
    sort_by_bfs(entry::Cell) -> sorted::Vector{Cell}
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


"""
    level_sort_by_bfs(entry::Cell) -> sorted::Vector{Vector{Cell}}
"""
function level_sort_by_bfs(entry::Cell)
    @assert isroot(entry) "not a root node"
    sorted = Vector{Vector{Cell}}()
    queue  = Vector{Vector{Cell}}()

    push!(queue, Cell[entry])
    while !isempty(queue)
        level = Vector{Cell}()
        cells = popfirst!(queue)
        push!(sorted, cells)
        for cell in cells
            if haskid(cell)
                for kid in kidsof(cell)
                    kid.indegree -= 1
                    if kid.indegree == 0
                        push!(level, kid)
                    end
                end
            end
        end
        if !isempty(level)
            push!(queue, level)
        end
    end

    return sorted
end


"""
    level_sort_by_dfs(entry::Cell) -> sorted::Vector{Vector{Cell}}
"""
function level_sort_by_dfs(entry::Cell)
    @assert isroot(entry) "not a root node"
    sorted = Vector{Vector{Cell}}()
    stack  = Vector{Vector{Cell}}()

    push!(stack, Cell[entry])
    while !isempty(stack)
        level = Vector{Cell}()
        cells = pop!(stack)
        push!(sorted, cells)
        for cell in cells
            if haskid(cell)
                for kid in kidsof(cell)
                    kid.indegree -= 1
                    if kid.indegree == 0
                        push!(level, kid)
                    end
                end
            end
        end
        if !isempty(level)
            push!(stack, level)
        end
    end

    return sorted
end
