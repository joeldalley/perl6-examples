Perl 6 Is Happening: Yes, Really
================================

On February 5th, 2015, I downloaded the December, 2014 Rakudo Star release of Perl 6, which I configured and built for the MoarVM back-end. And guess what? It's pretty fast. And it supports every language feature I've tried to use, so far. There is still a long way to go, before it's fully up to speed, and the language is fully supported. But it's now realistic to start writing programs in Perl 6--and I'm writing this as someone who first executed Rakudo Perl 6 code on ParrotVM at least 5 or 6 years ago; maybe 7 or 8. Back then, it was terrible. (I'm now using the February, 2015 Rakudo Star build, which isn't noticably different from the two month-old Rakudo Star release it replaced.)

The Language Itself
===================

The Perl 6 language as specified has always looked promising. Very promising. That was never the problem. Even going back to the year 2000, the design goal virtues of Perl 6 were clear. The barrier, until recently, was the absence of a usable implementation. Now, backed by MoarVM, I'm already spoiled by simple things, such as the ability to write the following code:

```perl
my Int %rolls;

# Roll a six-sided die 1,000 times, and count
# how many times each of the six sides came up.
# Note the auto-vivification of %roll's hash entries.
(1 .. 6).roll(1000).map: { %rolls{$_}++ };

say %rolls.sort.perl;
```

Outputs:

```
("1" => 166, "2" => 198, "3" => 160, "4" => 152, "5" => 163, "6" => 161)
```


Copyright & License
===================

All files in this repository are copyright &copy; Joel Dalley 2015, 
and are distributed under the same license as Perl.
