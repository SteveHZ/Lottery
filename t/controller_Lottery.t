use strict;
use warnings;
use Test::More;


use Catalyst::Test 'Lottery';
use Lottery::Controller::Lottery;

ok( request('/lottery')->is_success, 'Request should succeed' );
done_testing();
