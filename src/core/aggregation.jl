module Aggregation

function compute_frequencies(selections::Vector{Vector{Int}}, p::Int)
    B = length(selections)
    freqs = zeros(Float64, p)
    for sel in selections
        for j in sel
            freqs[j] += 1
        end
    end
    return freqs ./ B
end

function compute_counts(selections::Vector{Vector{Int}}, p::Int)
    counts = zeros(Int, p)
    for sel in selections
        for j in sel
            counts[j] += 1
        end
    end
    return counts
end
end