module StabilitySelection

using GLMNet
using Random

include("utils/types.jl")
include("utils/checks.jl")

include("core/subsampling.jl")
include("core/glmnet_wrapper.jl")
include("core/path_computation.jl")
include("core/aggregation.jl")
include("core/selection.jl")
include("core/api.jl")

include("plotting/plots.jl")

using .Types
using .Checks
using .Subsampling
using .GLMNetWrapper
using .PathComputation
using .Aggregation
using .Selection
using .API
using .Plotting

export stability_selection, stability_path, select_variables, StabilityResult, plot_frequencies, plot_selected

end
