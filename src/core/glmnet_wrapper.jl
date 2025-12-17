module GLMNetWrapper

using GLMNet
using Random
using Distributions

# calcul du lambda_min et lambda_1se en utilisant la validation croisée
function compute_lambda_min_1se(cv)
    meanloss = cv.meanloss
    stdloss = cv.stdloss
    lambda = cv.lambda

    i_min = argmin(meanloss)
    lambda_min = lambda[i_min]

    threshold = meanloss[i_min] + stdloss[i_min]
    i_1se = findlast(meanloss .<= threshold)
    lambda_1se = lambda[i_1se]

    return lambda_min, lambda_1se
end

# régression pour chaque subsample en utilisant la fonction glmnet julia
function fit_glmnet_subsample(
    X,
    y,
    idx::Vector{Int};
    lambda = :lambda_1se,
    rng = Random.GLOBAL_RNG,
    family = nothing,
    kwargs...
)

    Xs = X[idx, :]
    ys = y[idx]

    if isnothing(family)
        u = unique(ys)
        if length(u) == 2
            ys = Float64.(ys .== maximum(u))
            family = Binomial()
        else
            ys = Float64.(ys)
            family = Normal()
        end
    end

    cv = glmnetcv(Xs, ys, family; kwargs...)
    lambda_min, lambda_1se = compute_lambda_min_1se(cv)

    lam = lambda === :lambda_1se ? lambda_1se :
          lambda === :lambda_min ? lambda_min :
          lambda

    path = cv.path
    l = findfirst(==(lam), path.lambda)
    coefvec = path.betas[:, l]   # pas d'intercept !
    return findall(!=(0), coefvec)
end

end
