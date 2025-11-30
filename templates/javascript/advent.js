import fs from "fs";
const partOne = (input) => {
  return 1;
};

const partTwo = (input) => {
  return 2;
};

const args = process.argv.slice(2); //[1:]
if (args.length === 1 || args.length === 2) {
  let part = args[0];
  if (part !== "one" && part !== "two") {
    throw Error(`Part (${part}) needs to be one or two`);
  }
  let filename = `${part}.txt`;
  if (args.length === 2) {
    filename = args[1];
  }

  const input = fs
    .readFileSync(filename)
    .toString()
    .replace(/\r/g, "")
    .split("\n");

  if (part === "one") {
    console.log(partOne(input));
  } else {
    console.log(partTwo(input));
  }
} else {
  throw Error("Need to specify part and optionally input file");
}
