ENV["GKSwstype"]="100"

using Remark

#files =  filter( f -> startswith(f, "0"), readdir("src")) |> collect
#run(pipeline(`cat src/$files`; stdout="src/index.jl" ))
slides = Remark.slideshow(@__DIR__,
                       options = Dict("ratio" => "16:9"),
                       title = "Stage Logiciels 2025 : Julia")
