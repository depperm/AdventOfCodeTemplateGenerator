import os
import strformat
import strutils

proc partOne(input:seq[string]):int =
  return 1
proc partTwo(input:seq[string]):int =
  return 2

var args = commandLineParams()
if len(args) == 1 or len(args) == 2:
  #let input = ""
  let part = args[0]
  if part != "one" and part != "two":
    quit(fmt"Part ({part}) needs to be one or two", 1)
  var file = fmt"{part}.txt"
  if len(args) == 2:
    file = args[1]
  let input = multiReplace(readFile(file),[("\r","")]).split('\n')

  if part == "one":
    echo partOne(input)
  else:
    echo partTwo(input)
  #[
  input = `cat $file`.split("\n")
  # echo(input[0])
  if part == 'one' {
      echo(partOne(input))
  } else {
      echo(partTwo(input))
  }]#
else:
  quit(fmt"Need to specify part and optionally input file", 1)
