module Selection

# récupère les variables séléctionnées
function select_variables(freqs::AbstractVector, threshold::Real)
    return findall(>=(threshold), freqs)
end

# fonction pour les ordonner
function sort_selected(freqs::AbstractVector, selected::Vector{Int})
    return sort(selected, by=i -> freqs[i], rev = true)
end

# fonction pour avoir les 10 premières variables (par exemple)
function top_k_variables(freqs::AbstractVector, k::Int)
    idx = sortperm(freqs, rev = true) # descending
    return idx[1:k]
end
end