#! C:\Strawberry\perl\bin\perl.exe

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";
use Lottery;

my $app = Lottery->psgi_app(@_);

