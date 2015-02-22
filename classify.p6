# Example usage of Array.classify().
#
# @author Joel Dalley
# @version 2015/Feb/21

my Str @words = <What Will This Input Produce When Classified?>;
say "<== INPUT ARRAY ==>\n", @words.WHAT, " ", @words.perl, "\n";


Classify_By_Length: {
    # Classify words into an Array of Pairs, 
    # where each key is string length, and each value
    # is an array of words of that same length.
    my Pair @classified = (@words.classify: *.Str.chars).sort; 

    # Print in sorted order, shortest 
    # string length, to longest string length:
    print_classified "By String Length", @classified;
}

Classify_By_Ordinal_Sum: {
    # Classify words into an array of Pairs,
    # where each key is the ordinal sum value of 
    # the input word's letters, and each value is
    # an array of words having that ordinal sum value.
    my Block $sum = { (.split('').map: *.ord).reduce(* + *) };
    my Pair @classified = (@words.classify($sum)).sort.reverse;

    # Print in sorted order, greatest
    # ordinal sum to least ordinal sum:
    print_classified "By Ordinal Sum", @classified;
}


exit;


# Print @classified:
#
# @param [Pair] @classified Array of Pairs of (Int) => (Array).
# @return void
sub print_classified(Str $by, Pair @classified) {
    say "<== CLASSIFIED $by ==>";
    for @classified {
        say "\t$_.^name() of $_.key.^name() => $_.value.^name()",
            " ---> $_.key() => $_.value()";
    }
    say Nil.Str;
}
