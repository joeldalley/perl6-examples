# Example usage of a Bag type, and picking and rolling from it.
#  
# @author Joel Dalley
# @version 2015/Feb/22

my $ingredients = bag <rice beans tomatoes avocado onions rice peppers tortillas>;

say "Ingredients type   --> ", $ingredients.WHAT;      # Data type.
say "Ingredients data   --> ", $ingredients;           # All ingredients.
say "Sorted, unique keys -> ", $ingredients.keys.sort; # Sorted, unique ingredients.
say "Count bag contents --> ", $ingredients.elems;     # Count ingredients.
say "Integer weight sum --> ", $ingredients.total;     # Integer weight sum.

say Nil.Str; 

# Pick takes one item at random from the bag. 
say "Pick one      --> ", $ingredients.pick;     # Random single ingredient.
say "Pick three    --> ", $ingredients.pick: 3;  # Random 3 ingredients.
say "Pick ten      --> ", $ingredients.pick: 10; # Shuffle ingredients (there are only 8).
say "Pick infinite --> ", $ingredients.pick: *;  # Shuffle ingredients.

say Nil.Str;

# Roll is a weighted random selection. Since rice is in the bag twice, for example, it has
# a 2/8 or 25% chance of being rolled, each time (every roll is independent). By contrast,
# peppers has only a 1/8 or 12.5% chance of being rolled, each time.
say "Roll one                 --> ", $ingredients.roll;         # One at random.
say "Roll three               --> ", $ingredients.roll: 3;      # Three at random.
say "Expect one rice here     --> ", $ingredients.roll: 4;      # Four at random.
say "Roll ten                 --> ", $ingredients.roll: 10;     # Ten at random.
say "Roll infinite, slice ten --> ", $ingredients.roll(*)[^10]; # Ten, shuffled.

my @unique = $ingredients.keys;
my @sample_sizes = (10, 100, 1_000, 10_000, 25_000, 50_000, 100_000);

for @sample_sizes -> $size {
    say "Randomized dice rolls -- $size...";

    # Create a hash of (ingredient => roll count).
    my %rolls = @unique Z map {0}, @unique;
    $ingredients.roll(*)[^$size].map: { %rolls{$_}++ };

    # Rice should converge on 25% over larger sample 
    # sizes, and everything else should converge on 12.5%.
    for %rolls.keys.sort {
        say sprintf("\t%s %.2f", $_, 100.0 * %rolls{$_} / $size), '%';
    }
}
