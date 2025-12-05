include("../lib.jl")
function aocmain()


	lines = readlines("in.txt")
# 	lines = strlines("""3-5
# 10-14
# 16-20
# 12-18

# 1
# 5
# 8
# 11
# 17
# 32""")

	lines_ranges, lines_ids = vsplit(lines, "")

	ranges = []

	for line in lines_ranges
		a, b = parseints(split(line, '-'))

		push!(ranges, a:b)
	end

	total = 0

	for line in lines_ids
		id = parse(Int, line)
		for r in ranges
			if id in r
				total += 1
				break
			end
		end
	end

	println(total)


end
aocmain()
