# Example usage of Array.classify().
#
# @author Joel Dalley
# @version 2015/Feb/21

my @words = <What Will This Input Produce When Classified?>;
say "<== INPUT ARRAY ==>\n", @words.WHAT, " ", @words.perl, "\n";


Classify_By_Length: {
    # Classify words into an Array of Pairs, 
    # where each key is string length, and each value
    # is an array of words of that same length.
    my @classified = @words.classify: { .Str.chars };

    # Print in sorted order, shortest 
    # string length, to longest string length:
    print_classified "By String Length", 
                     @classified.sort: { $^a.key.Int <=> $^b.key.Int };
}

Classify_By_Ordinal_Sum: {
    # Classify words into an array of Pairs,
    # where each key is the ordinal sum value of 
    # the input word's letters, and each value is
    # an array of words having that ordinal sum value.
    my @classified = @words.classify: {
        (.split('').map: { .ord }).reduce(* + *)
    };

    # Print in sorted order, greatest
    # ordinal sum to least ordinal sum:
    print_classified "By Ordinal Sum",
                     @classified.sort: { $^b.key.Int <=> $^a.key.Int };
}


exit;


# Print @classified:
#
# @param Array @classified Array of Pairs of (Str) => (Array)..
# @return void
sub print_classified($by, @classified) {
    say "<== CLASSIFIED $by ==>";
    for @classified { 
        say "\t",
            .WHAT, " of ",                  # (Pair) of
            .key.WHAT, " => ", .value.WHAT, # (Str) => (Array)
            " ---> ", .key, " => ", .value;
    }
    print "\n";
}
