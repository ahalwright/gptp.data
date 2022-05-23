# originally copied from 9_25, then 10_18_21, then 5_1_22, then 5_9_22
# Adapted to use lincircuits
# for 5/22/22, reset defaut_funcs() in Func.jl to be the Raman 5-gate set
#include("../../src/CGP.jl")
using Main.CGP
using Random
cwd = pwd()
date = "5_22_22"
suffix = "D"
use_lincircuit = true
use_lc_str = use_lincircuit ? "linGP" : "cartGP"
fname = "geno_complexity_$(use_lc_str)_$(date)$suffix"
if cwd[end-5:end] == "CGP.jl"
  csvfile = "$cwd/data/$date/$fname.csv"
else
  csvfile = "../data/$date/$fname.csv"
end
numinputs = 4
numoutputs = 1
numinteriors = 10
numlevelsback=2
p = Parameters( numinputs=numinputs, numoutputs=numoutputs, numinteriors=numinteriors, numlevelsback=numlevelsback )
ngoals = 500
Random.seed!(2)
goallist = randgoallist( ngoals, p.numinputs, p.numoutputs )
#goallist = [[0x0003]]
#goallist = [ [g] for g = 0x0000:0xffff ]   # all goals
maxreps = 200
iter_maxreps = 100
max_tries = 300
max_steps=600000
gcdf = run_geno_complexity(goallist,maxreps,iter_maxreps,p,max_steps,max_tries, use_lincircuit=use_lincircuit, csvfile=csvfile )
