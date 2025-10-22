import ballerina/io;

function partOne(string[] input) returns int {
    return 1;
}
function partTwo(string[] input) returns int {
    return 2;
}

configurable string part = "one";
configurable string file = "sample.txt";

public function main() returns error? {
    if part != "one" && part != "two" {
        return error("Part ("+part+") needs to be one or two");
    }
    string[] input = check io:fileReadLines(file);
    if part == "one" {
        io:println(partOne(input));
    } else {
        io:println(partTwo(input));
    }
}