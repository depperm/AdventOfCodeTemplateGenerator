proc part_one {input} {
    return 1
}
proc part_two {input} {
    return 2
}


set file "puzzleInput.txt"

if {$argc == 0} {
    puts "Need to specify part and optionally input (demo)"
    exit
} elseif {$argc == 2} {
    set file [lindex $argv 1]
}

set part [lindex $argv 0]

if {$part != "one" && $part != "two"} {
    puts [format "Part (%s) needs to be one or two" $part]
    exit
}

set input {}
set infile [open $file r]
while {[gets $infile line] >= 0} {
    lappend input $line
}
close $infile

if {$part == "one"} {
    set result [part_one $input]
} else {
    set result [part_two $input]
}
puts $result