import "os" for Process
import "io" for File

var partOne = Fn.new { |input|
    return 1
}

var partTwo = Fn.new { |input|
    return 2
}

var ERROR = false
if (Process.arguments.count < 1 || Process.arguments.count>2) {
    System.print("Need to specify part and optionally input (demo)")
    ERROR = true
}
if (!ERROR) {
    var part = Process.arguments[0]
    if (part != "one" && part != "two") {
        System.print("Part (%(part)) needs to be one or two")
        ERROR = true
    }
    if (!ERROR) {
        var filename = "puzzleInput.txt"
        if (Process.arguments.count == 2) {
            filename = Process.arguments[1]
        }

        var lines = []
        File.open(filename) { |file|
            var offset = 0
            var line = ""
            while (true) {
                var b=file.readBytes(1, offset)
                offset = offset+1
                if(b=="\n") {
                    lines.add(line)
                    line=""
                }else if(b=="\r"){
                    //Windows wait for \n
                }else if (b=="") {
                    break
                }else{
                    line = line + b
                }
            }
            lines.add(line)
        }
        if (part == "one") {
            System.print(partOne.call(lines))
        } else {
            System.print(partTwo.call(lines))
        }
        //System.print(lines.join("\n"))
    }
}