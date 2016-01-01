#!/usr/bin/env perl
use strict;
use warnings;
use Lottery;

my $app = Lottery->psgi_app(@_);
 
#OddsCalc->setup_engine('PSGI');
#my $app = sub { OddsCalc->run(@_) };

