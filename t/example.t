# Examples of Perl 6 testing.
#
# @author Joel Dalley
# @version 2015/Feb/24

# Vars and a class that are used in tests.
my $three = 3;
my $eval_code = q[my $foobar = Foo::Bar.new(baz => 'quux')];
class Foo { has $!baz; submethod BUILD(Str :$!baz) {} }
class Foo::Bar is Foo {}

use Test;
plan 11;

# Check value equality.
ok $three == 3, 'The variable three equals 3';
nok pi == 3, 'The constant pi does not equal 3';
isnt pi, 3, 'The constant pi is not equal to 3';

# Check for pattern in string.
cmp_ok 'Here is a string', '~~', /is\sa/, 'Contains "is a"';

# Confirm object type.
isa_ok Foo::Bar.new(baz => 'bar'), Foo, 'Foo::Bar.new isa Foo';

# Confirm fatal runtime error.
dies_ok { Foo::Bar.new(baz => {}) }, 'Foo.baz must be a string';

# Confirm valid construction of Foo::Bar.
lives_ok { Foo::Bar.new(baz => Nil.Str) }, 'Foo.baz may be empty';

# Confirm exception types.
throws_like { Foo::Bar.new(baz => 1) }, X::TypeCheck::Binding;
throws_like { Foo::Bar.new(baz => '').baz }, X::Method::NotFound;

# Confirm eval.
eval_lives_ok $eval_code, 'EVAL was successful';
eval_dies_ok "$eval_code; whoops", 'Munged EVAL expr died';
