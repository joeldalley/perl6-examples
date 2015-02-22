class Singleton {
    has Str $!msg;
    method setMessage($str) { $!msg = $str }
    method message { $!msg }
    method comment { "Loop iteration..." }
}

sub SingletonFactory() {
    my Singleton $instance;

    sub {
        say "Enter factory function...";
        return $instance if $instance;

        $instance = Singleton.new;
        $instance.setMessage("\tConstructing Singleton...");
        say $instance.message;
        $instance;
    }
}

my $single;
my $factory = SingletonFactory;

for (1 .. 10) {
    $single = $factory();
    say $single.comment;
}
