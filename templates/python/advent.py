import sys


def partOne(input):
    return 1


def partTwo(input):
    return 2


args = sys.argv[1:]
if len(args) == 1 or len(args) == 2:
    part = args[0]
    if part != "one" and part != "two":
        quit("Part ({part}) needs to be one or two".format(part=part))
    filename = "{part}.txt".format(part=part)
    if len(args) == 2:
        filename = args[1]

    input = []
    with open(filename) as file:
        input = [line.rstrip() for line in file]

    if part == "one":
        print(partOne(input))
    else:
        print(partTwo(input))
else:
    quit("Need to specify part and optionally input file")
