############################################################################################################# MLE ID estimate
# author: annachiara korchmaros

# packages
using LearningAlgebraicVarieties
using Clustering
using Statistics
using Colors
using LinearAlgebra
using MAT
using ArgParse
using Plots

s = ArgParseSettings()
@add_arg_table s begin
    
    "finput"
        help = "path to data matrix as features X samples"
        required = true
    "fout"
    help = "path to the output figure"
    required = true
end
parsed_args = parse_args(ARGS, s)
# load data
input  =  parsed_args["finput"] 
file = matopen(input)
data=read(file)
close(file)
matrix_data=data["x"]

# load function
input_folder = dirname(input)
cd(input_folder)
include("estimate_dimension_savefig.jl")

# compute dimension diagram
output  =  parsed_args["fout"]
println("Computing dimension estimate ..") 
DimensionDiagramsSaveFig(matrix_data, false, output, diagrams = [:MLE])

println("Done!")





