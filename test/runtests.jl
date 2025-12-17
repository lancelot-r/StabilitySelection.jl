using Test
using CSV
using DataFrames
using StabilitySelection

data = CSV.read("test/data/epiclock.csv", DataFrame)

X = Matrix(data[:, 4:end])
y = data[:, 2]

time_sel = @elapsed results = stability_selection(X, y; B=10)
@info "stability_selection time = $(time_sel) seconds, R time : 107.3920 seconds."

time_path = @elapsed paths = stability_path(X, y; B=10)
@info "stability_path time = $(time_path) seconds, R time : 103.5061 seconds."

@test isa(results.frequencies, Vector{Float64})
@test length(results.frequencies) == size(X, 2)
@test isa(results.selected, Vector{Int})

plot_selected(results)