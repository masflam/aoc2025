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

	beam = Set([[Sidx]])

	println(beam)

	for line in lines[2:end]
		new_beam = Set()
		for timeline in beam
			i = timeline[end]
			if line[i] == '^'
				i > 1 && push!(new_beam, vcat(copy(timeline), [i-1]))
				i < n && push!(new_beam, vcat(copy(timeline), [i+1]))
			else
				push!(new_beam, vcat(copy(timeline), [i]))
			end
		end
		beam = new_beam
	end

	println(beam)
	println(length(beam))



end
aocmain()
