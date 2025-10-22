function partOne(input)
    return 1
end

function partTwo(input)
    return 2
end

if length(ARGS) == 1 || length(ARGS) == 2
    #input = ''
    part = ARGS[1]
    if part != "one" && part != "two"
        println("Part ("*part*") needs to be one or two")
        exit(1)
    end

    file = part*".txt"
    if length(ARGS) == 2
        file = ARGS[2]
    end

    input = readlines(file)
    if part == "one"
        println(partOne(input))
    else
        println(partTwo(input))
    end
else
    println("Need to specify part and optionally input file")
    exit(1)
end