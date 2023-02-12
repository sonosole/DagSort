export Cell
export kidsof
export nkidsof
export haskid
export ismarked
export setmarked
export unsetmarked
export addkid


mutable struct Cell{T}
    data::T
    kids::Vector{Cell{T}}
    ismarked::Bool
    indegree::Int
    function Cell(data::T) where T
        children = Vector{Cell{T}}()
        ismarked = false
        indegree = 0
        new{T}(data, children, ismarked, indegree)
    end
end


@inline  kidsof(c::Cell) = c.kids
@inline nkidsof(c::Cell) = length(c.kids)
@inline haskid(c::Cell)  = length(c.kids)>0 ? true : false

@inline ismarked(c::Cell) = c.ismarked
@inline setmarked(c::Cell) = c.ismarked = true
@inline unsetmarked(c::Cell) = c.ismarked = false

@inline addindegree(c::Cell) = c.indegree += 1
@inline reduceindegree(c::Cell) = c.indegree -= 1

@inline isroot(c::Cell) = c.indegree == 0

# pretty printing
function Base.show(io::IO, ::MIME"text/plain", c::Cell{T}) where T
    print("Cell{$T}(")
    print("$(c.data), nkids=$(nkidsof(c)), indegree=$(c.indegree)")
    print(")")
end

function Base.show(io::IO, ::MIME"text/plain", cs::Vector{Cell{T}}) where T
    n = length(cs)
    println("$n-element Cell{$T}:")
    for c in cs
        show(io, c)
    end
end

function addkid(parent::Cell, kid::Cell)
    push!(parent.kids, kid)
    addindegree(kid)
    return nothing
end


@inline function push!mark!(container::Vector, kid::Cell)
    push!(container, kid)
    setmarked(kid)
end

@inline function notempty(cells::Vector{Cell})
    return length(cells) ≠ 0
end
