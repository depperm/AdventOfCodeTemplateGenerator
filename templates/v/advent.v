module main

import os

fn part_one(input []string) int {
    return 1
}


fn part_two(input []string) int {
    return 2
}

fn main() {
    // println(os.args[1..])
    if os.args[1..].len == 1 || os.args[1..].len == 2 {
        part := os.args[1..][0]
        if part != "one" && part != "two" {
            panic("Part (${part}) needs to be one or two")
        }
        mut filename := "puzzleInput.txt"
        if os.args[1..].len == 2  {
            filename = os.args[1..][1]
        }

        mut input := []string{}
        if os.is_file(filename) {
            input = os.read_lines(filename) or {
                panic("ERROR reading file ${err}")
            }
            if part == "one" {
                println(part_one(input))
            } else {
                println(part_two(input))
            }
        } else {
            panic("Filename ${filename} does not exist")
        }
    } else {
        panic("Need to specify part and optionally input file")
    }

}
