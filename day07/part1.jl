include("../lib.jl")
function aocmain()


	
	lines = strlines(""".......S.......
...............
.......^.......
...............
......^.^......
...............
.....^.^.^.....
...............
....^.^...^....
...............
...^.^...^.^...
...............
..^...^.....^..
...............
.^.^.^.^.^...^.
...............
""")
	lines = readlines("in.txt")

	n = length(lines[1])
	Sidx = findfirst("S", lines[1])[1]

	beam = falses(n)
	beam[Sidx] = true

	nsplits = 0

	for line in lines[2:end]
		new_beam = falses(n)
		for i in 1:n
			if beam[i]
				if line[i] == '^'
					i > 1 && (new_beam[i-1] = true)
					i < n && (new_beam[i+1] = true)
					new_beam[i] = false
					nsplits += 1
				else
					new_beam[i] = true
				end
			end
		end
		beam = new_beam
	end

	println(nsplits)



end
aocmain()
