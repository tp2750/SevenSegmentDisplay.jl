using SevenSegmentDisplay
using Documenter

DocMeta.setdocmeta!(SevenSegmentDisplay, :DocTestSetup, :(using SevenSegmentDisplay); recursive=true)

makedocs(;
    modules=[SevenSegmentDisplay],
    authors="Thomas Poulsen",
    sitename="SevenSegmentDisplay.jl",
    format=Documenter.HTML(;
        canonical="https://tp2750.github.io/SevenSegmentDisplay.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/tp2750/SevenSegmentDisplay.jl",
    devbranch="main",
)
