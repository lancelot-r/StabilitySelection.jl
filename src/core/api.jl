module API

using ..Checks: check_inputs
using ..Types: StabilityResult
using ..PathComputation: compute_stability_path
using ..Subsampling: generate_subsamples
using ..Aggregation: compute_frequencies
using ..Selection: select_variables
using Random

export stability_selection, stability_path, select_variables

# fonction principale
function stability_selection(
    X, y;
    B = 100,
    subsample_fraction = 0.5,
    lambda = :lambda_1se,
    threshold = 0.9,
    rng = Random.GLOBAL_RNG,
    kwargs...
)
    check_inputs(X, y, B, subsample_fraction, lambda, threshold)

    subsamples = generate_subsamples(size(X, 1), B, subsample_fraction, rng)

    selections = compute_stability_path(
        X, y, subsamples;
        lambda = lambda,
        rng = rng,
        kwargs...
    )

    freqs = compute_frequencies(selections, size(X, 2))

    selected_vars = select_variables(freqs, threshold)

    return StabilityResult(freqs, threshold, selected_vars, Dict(
        :B => B,
        :lambda => lambda,
        :subsample_fraction => subsample_fraction
    ))
end

# fonction pour calculer les chemins de selection
function stability_path(
    X, y;
    B = 100,
    subsample_fraction = 0.5,
    lambda = :lambda_1se,
    threshold = 0.9,
    rng = Random.GLOBAL_RNG,
    kwargs...
)
    subsamples = generate_subsamples(size(X, 1), B, subsample_fraction, rng)
    return compute_stability_path(X, y, subsamples; lambda = lambda, rng = rng, kwargs...)
end
end