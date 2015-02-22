my $fruits = set <apple apple banana orange tomato apple>;
my $tomato = set <tomato>;

say $fruits.WHAT, " Fruits: $fruits";
say "Fruits count: ", $fruits.elems;
say $tomato.WHAT, " Tomato: $tomato";
say "Is banana an elem of fruits? --> ", 'banana' (elem) $fruits;
say "Is tomato a subset of fruits? --> ", $tomato (<) $fruits;
