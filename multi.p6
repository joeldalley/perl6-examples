my class Foo {
    method Str() { 'Foo as a string' }
}

multi printer(Foo $foo) { say "Foo: " ~ $foo }
multi printer(Int $int) { say "Int: " ~ $int.perl }
multi printer(Str $str) { say "Str: " ~ $str.perl }
multi printer(Rat $rat) { say "Rat: " ~ $rat.perl }

printer $_ for (Foo.new, "String", 1, Rat.new(22, 7));
