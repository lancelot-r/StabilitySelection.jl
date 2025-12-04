module Subsampling

using Random

function generate_subsamples(n::Int, B::Int, fraction::Real, rng)
    k = floor(Int, n * fraction)
    samples = Vector{Vector{Int}}(undef, B)
    for b in 1:B
        samples[b] = randperm(rng, n)[1:k]
    end
    return samples
end

function generate_subsamples_stratified(y::AbstractVector, B::Int, fraction::Real, rng)
    pos = findall(==(1), y)
    neg = findall(==(0), y)
    kps = floor(Int, length(pos) * fraction)
    kneg = floor(Int, length(neg) * fraction)
    samples = Vector{Vector{Int}}(undef, B)
    for b in 1:B
        s1 = rand(rng, pos, kpos; replace=false)
        s2 = rand(rng, neg, kpos; replace = false)
        samples[b] = vcat(s1, s2)
    end
    return samples
end
end