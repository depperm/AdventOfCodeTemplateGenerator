function partOne(input)
    return 1
end

function partTwo(input)
    return 2
end

if #arg == 1 or #arg == 2 then
    local part = arg[1]
    if part ~= "one" and part ~= "two" then
        print("Part (%s) needs to be one or two", part)
        os.exit(1)
    end
    local file = string.format("%s.txt", part)
    if #arg == 2 then
        file = arg[2]
    end
    local input = {}
    for line in io.lines(file) do
        input[#input + 1] = line
    end
    for n, c in pairs(input) do
        print('#' .. n .. ': ', c)
    end
    if part == "one" then
        print(partOne(input))
    else
        print(partTwo(input))
    end
else
    print("Need to specify part and optionally input file")
    os.exit(1)
end
