# Example usage of race and hyper to parallelize an array operation.
#  
# @author Joel Dalley
# @version 2016/Jan/15

my @nums = (1..100_000);
say "Use is-prime to ID primes in 1..100_000";

my $start = now;
@nums.map: { is-prime $_ };
say "Array.map time: ", now - $start, "s";

$start = now;
@nums.race.map: { is-prime $_ };
say "Array.race.map: ", now - $start, "s";

$start = now;
@nums.hyper.map: { is-prime $_ };
say "Array.hyper.map: ", now - $start, "s";
