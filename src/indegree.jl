export indegree
export resetindegree


function indegree(entry::Cell; by::Function=visit_by_dfs)
    # traverse dag
    cells = by(entry)
    # first zero
    idegree = Dict{Cell,Int}()
    for cell in cells
        push!(idegree, cell => 0)
    end
    # then calculate indegree
    for (cell, ins) in idegree
        if haskid(cell)
            for kid in kidsof(cell)
                idegree[kid] += 1
            end
        end
    end
    return idegree
end


function resetindegree(entry::Cell; by::Function=visit_by_dfs)
    # traverse dag
    cells = by(entry)
    # first zero
    for cell in cells
        cell.indegree = 0
    end
    # then calculate indegree
    for cell in cells
        if haskid(cell)
            for kid in kidsof(cell)
                kid.indegree += 1
            end
        end
    end
end
