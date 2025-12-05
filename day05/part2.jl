include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
	lines = strlines("""3-5
10-14
16-20
12-18

1
5
8
11
17
32""")

	lines_ranges, _lines_ids = vsplit(lines, "")

	ranges = []

	for line in lines_ranges
		a, b = parseints(split(line, '-'))
		push!(ranges, a:b)
	end

	struct Node
		value::Int
		left:: Union{Node, Nothing}
		rite:: Union{Node, Nothing}
	end
	
	root = Node(0, nothing, nothing)

	function update(p, q, l, r)
	end


end
aocmain()
