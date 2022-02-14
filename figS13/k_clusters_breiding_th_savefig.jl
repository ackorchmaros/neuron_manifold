################################################# NPCA with Breiding threshold wrt k ID estimate PLOT
# author: annachiara korchmaros
# orginal script: EstimateDimensionMLE from "Learning algebraic varieties from samples"", Breiding et al.

########
# Main #
########

"""
Produces NPCA Dimension vs. k Diagram.
* data is a matrix whose n rows are the data points.
* ranks is a matrix whose rows are the NNs rank/value.
There are some optional arguments.
* k_ticks = k puts into k evenly spaces k on [1,n-1] at which the dimension is computed.
* fontsize sets the fontsize of the axes.
* lw sets the linewidth.
"""
function DimensionDiagramsNPCAnn(
    data::Array{T,2},
    ranks::Array{S,2},
    k_ticks::Integer,
    fout::String;
    lw = 4
    ) where {T,S <: Number}

    n = size(data,1)
    m = size(data,2)
    colors = "darkorange1"
    y_upper = min(n,m)+0.1

    k = Array{Integer}(range(10, step = ceil((n-10)/k_ticks), stop = n-1+ceil((n-10)/k_ticks)))

    p = Plots.plot()
    d = EstimateDimensionNPCAthB(data,ranks,k_ticks)
    Plots.plot!(p, k, d, lw = lw, linecolor = colors)

    savefig(p,fout)
end

#####################################################
# Clusters respect to k=number of nearestneighbours #
#####################################################
#input: k
#output: list of unique clusters with the sample followed by all its k NNs 
function k_clusters(k::Integer,ranks::Array{T,2},sample_size::Integer)where {T<:Number}
	points=Array{Integer}(range(1, length = sample_size, stop = sample_size))
  	clusters_list = map(points) do point
		nn_s=findall(ranks[point,:] .<= k) 
		return(nn_s)
	end
	return clusters_list
end
#################################
# PCA with Breiding's threshold #
#################################
function EstimateDimensionPCAthB(data::Array{T,2}) where {T <: Number}
    n = size(data, 1)
    data = data .- Statistics.mean.([data[i,:] for i in 1:n])
    if size(data, 2) > 1
        L = log10.(LinearAlgebra.svdvals(data))
        if length(L) == 1
            if L[1] < 1e-15
                return 0
            else
                return 1
            end
        else
            i = findmin(diff(L))
            # return rank(data)
            return i[2]
        end
    else
        return 0
    end
end

#################
# Nonlinear PCA #
#################
function EstimateDimensionNPCAthB_k(data::Array{T,2}, ranks::Array{R,2}, k_array::Array{S,1}) where {S,T,R<:Number} 
    sample_size=size(data,1)
    ambient_dim = size(data,2)
    return map(k_array) do k
        clusters = k_clusters(k,ranks,sample_size)
        number_points=ceil(Integer,sample_size/k)  # choose number of points=ceil(2800/k) uniformly
        Random.seed!(170714); # mouse tag
        selected_points=sort(sample(1:sample_size,number_points, replace = false))
        clusters=clusters[selected_points]
        r = map(clusters) do cluster
            return EstimateDimensionPCAthB(data[cluster,:]) 
        end
        out=sum(r)/number_points
        if k<= ambient_dim
        		println("Working on k=",k)
        		println("Dimension=",out)
                println(out)
       	end
        return out
    end
end

function EstimateDimensionNPCAthB(data::Array{T,2},ranks::Array{R,2},k_ticks) where {T,R<:Number}
	n=size(data,1)
	k_array = Array{Integer}(range(10, step = ceil((n-10)/k_ticks), stop = n-1+ceil((n-10)/k_ticks)))
	return EstimateDimensionNPCAthB_k(data, ranks, k_array)
end
