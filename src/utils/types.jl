module Types

struct StabilityResult
    frequencies::Vector{Float64}
    threshold::Float64
    selected::Vector{Int}
    meta::Dict{Symbol, Any}
end
end