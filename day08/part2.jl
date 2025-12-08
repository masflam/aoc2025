include("../lib.jl")
function aocmain()


	lines = strlines("""162,817,812
57,618,57
906,360,560
592,479,940
352,342,300
466,668,158
542,29,236
431,825,988
739,650,466
52,470,668
216,146,977
819,987,18
117,168,530
805,96,715
346,949,466
970,615,88
941,993,340
862,61,35
984,92,344
425,690,689
""")
	lines = readlines("in.txt")

	dist(a, b) = (a[1] - b[1])^2 + (a[2] - b[2])^2 + (a[3] - b[3])^2 |> sqrt


	n = length(lines)
	points = []
	parents = []
	subsz = []

	function dsu_union(i, j)
		i = dsu_find(i)
		j = dsu_find(j)
		i == j && return false
		subsz[i] < subsz[j] && return dsu_union(j, i)
		parents[j] = i
		subsz[i] += subsz[j]
		return true
	end

	function dsu_find(i)
		# println("i = $i, parents[i] = $(parents[i])")
		if i == parents[i]
			return i
		else
			parents[i] = dsu_find(parents[i])
			return parents[i]
		end
	end

	for line in lines
		x,y,z = parseints(split(line, ','))
		push!(points, (x,y,z))
		push!(parents, length(parents) + 1)
		push!(subsz, 1)
	end

	# (w, a, b)
	edges = []
	for i in 1:length(points)
		for j in i+1:length(points)
			d = dist(points[i], points[j])
			push!(edges, (d, i, j))
		end
	end

	sort!(edges)

	graph = [[] for i in 1:n]

	last_mst_edge = nothing

	for (w, i, j) in edges
		println("(w=$w, i=$i, j=$j, a=$(points[i]), b=$(points[j]))")
		if dsu_union(i, j)
			last_mst_edge = (i, j)
			push!(graph[i], j)
			push!(graph[j], i)
		end
	end

	println(last_mst_edge)
	println(points[last_mst_edge[1]], points[last_mst_edge[2]])
	println(points[last_mst_edge[1]][1] * points[last_mst_edge[2]][1])

end
aocmain()
