module PathComputation

using Random
using ..GLMNetWrapper: fit_glmnet_subsample

function compute_stability_path(
    X,
    y,
    subsamples::Vector{Vector{Int}};
    lambda=:lambda_1se,
    rng=Random.GLOBAL_RNG,
    kwargs...
)

    B = length(subsamples)
    selections = Vector{Vector{Int}}(undef, B)
    for b in 1:B
        idx = subsamples[b]
        selections[b] = fit_glmnet_subsample(X, y, idx; lambda=lambda, rng= rng, kwargs...)
    end
    return selections
end
end