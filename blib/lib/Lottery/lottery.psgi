use strict;
use warnings;

use Lottery;

my $app = Lottery->apply_default_middlewares(Lottery->psgi_app);
$app;

