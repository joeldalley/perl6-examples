# Perl 6 Regexes.
#
# @author Joel Dalley
# @version 2015/Feb/26

# Named capture.
if "A pound sign # in this string." ~~ /$<pound> = 'sign # in'/ {
    say "pound => $/<pound>";
}

say Nil.Str;

Named_Regexes: {
    # Sample text.
    my $letters = '0041 A LATIN CAPITAL LETTER A'
                ~ '0031 1 DIGIT ONE'
                ~ '03B4 δ GREEK SMALL LETTER DELTA'
                ~ '03F3 ϳ GREEK LETTER YOT'
                ~ '0409 Љ CYRILLIC CAPITAL LETTER LJE';

    # Named captures for three specified non-latin 
    # letters, which can have anything in between them:
    my regex non-latin-named { $<delta> = δ .* $<yot> = ϳ .* $<lje> = Љ }

    if $letters ~~ /<non-latin-named>/ {
        for <delta yot lje> -> $char { 
            say "non-latin-named: $char => $/<non-latin-named>{$char}" 
        }
    }

    say Nil.Str;

    # Returns the first character that isn't a space or a-zA-Z0-9.
    # This can be used with the :global regex adverb, in combination
    # with an array context for the return value, in order to get
    # an array of all matches in the string.
    my regex non-latin-unnamed { <-[\sa..zA..Z0..9]> }

    for ($letters ~~ m:g/<non-latin-unnamed>/) -> $match { 
        say "Non-latin-unnamed: $match.Str()" 
    }
}
