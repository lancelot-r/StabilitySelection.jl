module Selection

function select_variables(freqs::AbstractVector, threshold::Real)
    return findall(>=(threshold), freqs)
end

function sort_selected(freqs::AbstractVector, selected::Vector{Int})
    return sort(selected, by=i -> freqs[i], rev = true)
end

function top_k_variables(freqs::AbstractVector, k::Int)
    idx = sortperm(freqs, rev = true) # descending
    return idx[1:k]
end
end