package Lottery::Schema::ResultSet::LotteryBase;

use strict;
use warnings;
use base 'DBIx::Class::ResultSet';

sub order_by {
	my ($self, $orderby, $order) = @_;
	
	return $self->search (
	{},{
		order_by => { -$order => $orderby },
	});
}

1;
