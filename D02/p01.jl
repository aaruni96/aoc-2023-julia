ifile = open("input.txt", "r")
input = read(ifile, String)

ind = Dict("red" => 1, "green" => 2, "blue" => 3)
max = [12, 13, 14]
sum = 0
flag = 0

for line in eachline(IOBuffer(input))
    gno = parse(Int, match(r"[0-9]+:", line).match[begin:end-1])
    astring = split(match(r":.*$", line).match[3:end], "; ")
    for pstring in astring
        for ppstring in split(pstring, ", ")
            # "4 green"
            number, schluss = split(ppstring, " ")
            number = parse(Int, number)
            if (number > max[ind[schluss]])
                global flag=1
            end
            #println(number, " ", schluss)
            #println(flag)
            #println(max[ind[schluss]])
        end
    end
    if flag==1
        global flag=0
        continue
    end
    global sum = sum+gno
end
println(sum)