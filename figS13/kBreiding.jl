############################################################################################################# NPCA with Breiding threshold wrt k ID estimate WRAPPER
# author: annachiara korchmaros

# load packages
using Clustering
using Statistics
using Colors
using LinearAlgebra
using MAT
using ArgParse
using Distributions
using Random
using Plots

s = ArgParseSettings()
@add_arg_table s begin
    
    "finput"
        help = "path to data matrix as features X samples"
        required = true
    "fout"
    help = "path to the output figure"
    required = true

    "fNN"
        help = "path to data matrix with numbers of NN"
        required = true
end
parsed_args = parse_args(ARGS, s)

# load data
input  =  parsed_args["finput"] 
file = matopen(input)
data=read(file)
close(file)
matrix_data=data["x"]

NN  =  parsed_args["fNN"] 
file = matopen(NN)
data=read(file)
close(file)
matrix_NN=data["x"]


# load function
input_folder = dirname(input)
cd(input_folder)
include("k_clusters_breiding_th_savefig.jl")

# compute dimension diagram
println("Computing dimension estimate ..") 
output  =  parsed_args["fout"]
DimensionDiagramsNPCAnn(matrix_data, matrix_NN,50,output)

println("Done!")





