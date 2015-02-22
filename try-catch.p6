# Perl 6 try { CATCH {} }.
#
# @author Joel Dalley
# @version 2015/Feb/22

# A Nat has a positive Int in a private field, $x.
class Nat {
    class Nat::InvalidArgument is Exception {
        method message() { 'Only positive integers are valid' }
    }

    has Int $!x;

    submethod BUILD(Int :$x) {
        die Nat::InvalidArgument.new unless $x > 0;
        $!x = $x;
    }

    method Str() { $!x } 
}

Try_CATCH: {
    try {
        # Legitimate, prints 3.
        say Nat.new(x => 3).Str;

        my $arg;
        # Infinite size array, but control moves to the
        # CATCH block within the first loop iteration.
        for (-1, -2 ... *) { Nat.new(x => $arg = $_) }
        CATCH {
            when Nat::InvalidArgument { 
                say .message ~ " -- `$arg` was given" 
            }
        }
    }

    try { 
        # Type check failure.
        my $str = 'Can $Nat.x be a string?';
        Nat.new(x => $str);
        CATCH { default { say .message } }
    }

    # Valid construction; but then attempting to 
    # access private $Nat.x is a fatal runtime error.
    try { 
        say Nat.new(x => 4).x;
        CATCH { when X::Method::NotFound { say .message } }
    }
}

say "Got to the end."
