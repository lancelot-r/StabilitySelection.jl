module Checks

function check_inputs(X, y, B, fraction, lambda, threshold)
    n, p = size(X)
    if length(y) != n
        error("X and y have incompatible dimensions")
    end
    if B < 1
        error("B must be at least 1")
    end 
    if fraction <= 0 || fraction > 1
        error("subsamples_fraction must be in ]0,1]")
    end
    if threshold < 0 || threshold > 1
        error("threshold must be in [0,1]")
    end
    if !(lambda === :lambda_1se || lambda === :lambda_min || isa(lambda, Number))
        error("lambda must be :lambda_1se, :lambda_min, or a numeric value")
    end
end
end