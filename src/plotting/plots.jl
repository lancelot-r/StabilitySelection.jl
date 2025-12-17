module Plotting

using CairoMakie
using ..Types: StabilityResult

export plot_frequencies, plot_selected

# fonction pour plot les fréquences de selection
function plot_frequencies(result::StabilityResult)
    freqs = result.frequencies
    p = length(freqs)

    fig = Figure(size = (900, 350))
    ax = Axis(fig[1, 1],
    xlabel = "Variable index",
    ylabel = "Selection frequency",
    title = "Stability selection frequencies"
    )

    barplot!(ax, 1:p, freqs)

    hlines!(ax, [result.threshold], color = :red, linestyle = :dash, linewidth = 2)

    fig 
end

# fonction pour plot les variables selectionnées
function plot_selected(result::StabilityResult)
    freqs = result.frequencies
    selected = result.selected

    isempty(selected) && error("No variables selected at threshold $(result.threshold).")

    fig = Figure(size = (900, 350))
    ax = Axis(fig[1, 1],
    xlabel = "Variable index",
    ylabel = "Selective frequency",
    title = "Variable selected by Stability Selection"
    )

    barplot!(ax, selected, freqs[selected])

    hlines!(ax, [result.threshold], color = :red, linestyle = :dash, linewidth = 2)

    fig

end
end