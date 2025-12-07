my $part= @ARGV[0];
my $file = @ARGV[1];

sub part_one {
    my ($input) = @_;
    return 1
}
sub part_two {
    my ($input) = @_;
    return 2
}

if ($part eq "") {
    print "Need to specify part and optionally input file";
    exit 1;
} elsif ($part ne "one" && $part ne "two") {
    print "Part ($part) needs to be one or two";
    exit 1;
}
if ($file eq "") {
    $file = "puzzleInput.txt";
}

open my $fh, '<', $file or die "Could not find $file";
my @lines = qw();
while (my $line = <$fh>) {
    chomp $line;
    push @lines, $line
}
close $fh;

if ($part eq "one") {
    print part_one(@lines);
} else {
    print part_two(@lines);
}