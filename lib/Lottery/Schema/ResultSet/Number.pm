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

	my ($coderef, $draw, $idx, $count, $str, $buf, $i);

	$coderef = sub {
		my $objref = shift; # calling ComboGen object
		$count = 0;
		$str = "";

		DRAW:
  		foreach $draw (@lottery) {
			my @numbers = split(/ /,$draw->numbers);
			shift(@numbers); # remove initial space
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

		for ($i = 0;$i < $objref->selections;$i ++) {
			$buf = sprintf ("%2d",$my_numbers [ $objref->index ($i) ] ); # build str for view
			$str .= $buf. " ";
		}
		
		push ($array, { numbers => $str,
						appearances => $count,
		});

	}; # end of anonymous sub

	for ($i = 1; $i <= 6; $i++) {
		my $gen = ComboGen->new ($i,6);
		$gen->onIteration ($coderef);
		$gen->run ();
	}

	return $array;
}

1;
