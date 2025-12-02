using StabilitySelection
using Documenter

DocMeta.setdocmeta!(StabilitySelection, :DocTestSetup, :(using StabilitySelection); recursive=true)

makedocs(;
    modules=[StabilitySelection],
    authors="lancelot-r <lancelotravier@gmail.com>",
    sitename="StabilitySelection.jl",
    format=Documenter.HTML(;
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)
