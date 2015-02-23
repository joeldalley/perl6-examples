# Example usage of classify().
#
# @author Joel Dalley
# @version 2015/Feb/21

my Str @words = <What Will This Input Produce When Classified?>;
say "<== INPUT ARRAY ==> @words.perl()\n";


Classify_By_Length: {
    # Classify by the length of each given word. 
    # Sort, so the smallest value is first.
    my Pair @classified = (@words.classify: *.Str.chars).sort; 
    print_classified "By String Length", @classified;
}

Classify_By_Ordinal_Sum: {
    # Classify by the sum or ord() values, for each letter in
    # a given word. Reverse sort, so the largest value is first.
    my Block $sum = { (.split('').map: *.ord).reduce(* + *) };
    my Pair @classified = (@words.classify($sum)).sort.reverse;
    print_classified "By Ordinal Sum", @classified;
}


exit;


# @param Pair @classified Array of Pairs of Int => Array.
# @return void
sub print_classified(Str $by, Pair @classified) {
    say "<== CLASSIFIED $by ==>";
    for @classified {
        say "\t$_.^name() of $_.key.^name() => $_.value.^name()",
            " ---> $_.key() => $_.value()";
    }
    say Nil.Str;
}
