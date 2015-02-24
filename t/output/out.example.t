1..11
ok 1 - The variable three equals 3
ok 2 - The constant pi does not equal 3
ok 3 - The constant pi is not equal to 3
ok 4 - Contains "is a"
ok 5 - Foo::Bar.new isa Foo
ok 6 - Foo.baz must be a string
ok 7 - Foo.baz may be empty
    1..2
    ok 1 - code dies
    ok 2 - right exception type (X::TypeCheck::Binding)
ok 8 - did we throws_like X::TypeCheck::Binding?
    1..2
    ok 1 - code dies
    ok 2 - right exception type (X::Method::NotFound)
ok 9 - did we throws_like X::Method::NotFound?
ok 10 - EVAL was successful
ok 11 - Munged EVAL expr died
