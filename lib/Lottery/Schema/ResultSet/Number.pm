package Lottery::Schema::ResultSet::Number;

use strict;
use warnings;
use base 'Lottery::Schema::ResultSet::LotteryBase';

use ComboGen;

sub check_my_numbers {
	my $self = shift;

	my @lottery = $self->all;
	my @my_numbers = (qw /2 3 10 11 23 39/);
	my $array = [];

	my ($draw, $idx, $str, $i);
	
	my $coderef = sub {
		my $objref = shift; # calling ComboGen object
		my @temp = ();
		my $count = 0;

		DRAW:
  		foreach $draw (@lottery) {
			my @numbers = split (/ /, $draw->numbers);
			shift (@numbers); # remove initial space
			$idx = 0;

			foreach (@numbers) {

				# already gone past number we are looking for ??
				next DRAW if ($_ > $my_numbers [ $objref->index ($idx) ] ); 

				if ($_ == $my_numbers [ $objref->index ($idx) ] ) {
				
					# found all of the numbers we are looking for ?
					if (++$idx == $objref->selections) { 
						$count ++;
						next DRAW;
					}			
				}
			}
		}

		push (@temp, $my_numbers [ $objref->index ($_) ] ) for (0...$objref->selections - 1);
		$str = join (' ', map { sprintf "%2d", $_ } @temp); 		

		push (@$array, {
			numbers => $str,
			appearances => $count,
		});

	}; # end of anonymous sub

	for $i (1...6) {
		my $gen = ComboGen->new ($i,6);
		$gen->onIteration ($coderef);
		$gen->run ();
	}

	return $array;
}

1;
