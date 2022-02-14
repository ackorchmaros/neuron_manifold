################################################# NPCA diagram wrt the ball radius eps and tight threshold PLOT
# author: annachiara korchmaros
# source: EstimateDimensionMLE from "Learning algebraic varieties from samples"", Breiding et al.

################################
# Plot NPCA Dimension Diagrams #
################################
"""
Produces Dimension Diagrams.
* data is a matrix whose colums are the data points.
There are some optional arguments.
* eps_ticks = k puts into k evenly spaces ϵ on [0,1] at which the dimension is computed.
* lw sets the linewidth.
"""

function DimensionDiagramsNPCAth(
    data::Array{T,2},
    fout::String;
    eps_ticks = 25,
    lw = 4,
    log_log = false
    ) where {T <: Number}
    
    n = size(data,2)

    colors = "purple1"
    ϵ = Array{Float64}(range(0.1, length = eps_ticks, stop = 1))
    
    p = Plots.plot()
    d = EstimateDimensionNPCAth(data)
    Plots.plot!(p, ϵ, d, lw = lw, linecolor = colors)
    
    y_upper = min(n + 1 + 0.1, ceil(maximum(d)))

    Plots.plot(p,
              xlims = [0,1],
              ylims = [0,y_upper],
              tickfont = 20,
              labelfontsize = 30,
              xlabel = "ϵ",
              ylabel = "d(ϵ)",
              xscale = :none,
              yscale = :none,
              legend = false,
              yguidefontrotation=-90,
              ylim = (0,y_upper),
              size = (800, 900),
              dpi = 300
      )
    
    savefig(p,fout)
end
######################
# PCA with threshold #
######################
function EstimateDimensionPCAth(data::Array{T,2}) where {T <: Number}
    n = size(data, 1)
    data = data .- Statistics.mean.([data[i,:] for i in 1:n])
    if size(data, 2) > 1
        L = LinearAlgebra.svdvals(data)
        epsilon=eps()
        maxSize=max(size(data, 2),size(data, 1))
    	value=maxSize*epsilon*L[1]
    	count=length(L[L .> value])
		return count
    else
        return 0
    end
end
#################
# Nonlinear PCA #
#################
function EstimateDimensionNPCAthEpsilon(data::Array{T,2}, ϵ_array::Vector{S}) where {S,T<:Number}
    dist = ScaledEuclidean(data)
    H = Clustering.hclust(dist, linkage = :single)
    m = size(data,2)
    return map(ϵ_array) do ϵ
        myclust = Clustering.cutree(H, h = ϵ)
        groups = unique(myclust)
        r = map(groups) do group
            index = findall(myclust .== group)
            return EstimateDimensionPCAth(data[:,index]) * length(index)
        end
        return sum(r) / m
    end
end
function EstimateDimensionNPCAth(data::Array{T,2}; eps_ticks = 25) where {T<:Number}
    ϵ = Array{Float64}(range(0.1, length =eps_ticks, stop = 1))
    EstimateDimensionNPCAthEpsilon(data, ϵ)
end

