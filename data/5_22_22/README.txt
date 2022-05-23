Procedure for generating the plots:

julia -L CGP.jl

julia> using Plots
julia> gr()
julia> ddf = read_dataframe("../data/5_22_22/geno_complexity_linGP_5_22_22D.csv")
julia> edf = read_dataframe("../data/5_22_22/geno_complexity_cartGP_5_22_22E.csv")
julia> scatter(edf.robustness,edf.evo_count,xlabel="robustness",ylabel="evolution evolvability",labels="")
julia> savefig("../data/5_22_22/evolvability_vs_robustness_CGP_5funcs_4x1_11_8.png")
julia> scatter(ddf.robustness,ddf.evo_count,xlabel="robustness",ylabel="evolution evolvability",labels="")
julia> savefig("../data/5_22_22/evolvability_vs_robustness_LGP_5funcs_4x1_10_2.png")

