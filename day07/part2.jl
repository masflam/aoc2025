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

	beam = zeros(Int, n)
	beam[Sidx] = 1

	nsplits = 0

	for line in lines[2:end]
		println(beam)
		new_beam = zeros(Int, n)
		for i in 1:n
			if beam[i] > 0
				if line[i] == '^'
					i > 1 && (new_beam[i-1] += beam[i])
					i < n && (new_beam[i+1] += beam[i])
					nsplits += 1
				else
					new_beam[i] += beam[i]
				end
			end
		end
		beam = new_beam
	end

	println(beam)
	println(sum(beam))



end
aocmain()
