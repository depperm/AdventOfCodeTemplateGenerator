package main

import (
	"bufio"
	"fmt"
	"os"
)

func partOne(input []string) int {
	return 1
}

func partTwo(input []string) int {
	return 2
}

func main() {
	args := os.Args[1:] // skip program name

	if len(args) == 1 || len(args) == 2 {
		part := args[0]
		if part != "one" && part != "two" {
			panic(fmt.Sprintf("Part (%s) needs to be one or two", part))
		}

		filename := "puzzleInput.txt"
		if len(args) == 2 {
			filename = args[1]
		}

		// check file existence
		file, err := os.Open(filename)
		if err != nil {
			panic(fmt.Sprintf("Filename %s does not exist or cannot be opened", filename))
		}
		defer file.Close()

		// read lines
		var input []string
		scanner := bufio.NewScanner(file)
		for scanner.Scan() {
			input = append(input, scanner.Text())
		}
		if err := scanner.Err(); err != nil {
			panic(fmt.Sprintf("ERROR reading file: %v", err))
		}

		// run the chosen part
		if part == "one" {
			fmt.Println(partOne(input))
		} else {
			fmt.Println(partTwo(input))
		}
	} else {
		panic("Need to specify part and optionally input file")
	}
}
