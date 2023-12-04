ifile = open("input.txt", "r")
input = read(ifile, String)

ind = Dict("red" => 1, "green" => 2, "blue" => 3)
sum = 0
flag = 0

for line in eachline(IOBuffer(input))
    maxarr = [0, 0, 0]
    power = 1
    gno = parse(Int, match(r"[0-9]+:", line).match[begin:end-1])
    astring = split(match(r":.*$", line).match[3:end], "; ")
    for pstring in astring
        for ppstring in split(pstring, ", ")
            number, schluss = split(ppstring, " ")
            number = parse(Int, number)
            maxarr[ind[schluss]] = max(maxarr[ind[schluss]], number)
        end
    end
    for comp in maxarr
        power = power * comp
    end
    global sum = sum + power
end
println(sum)