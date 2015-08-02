use utf8;
package Lottery::Schema::Result::Number;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Lottery::Schema::Result::Number

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<numbers>

=cut

__PACKAGE__->table("numbers");

=head1 ACCESSORS

=head2 draw_no

  data_type: 'integer'
  is_nullable: 0

=head2 day

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 numbers

  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 bonus

  data_type: 'integer'
  is_nullable: 1

=head2 draw_date

  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "draw_no",
  { data_type => "integer", is_nullable => 0 },
  "day",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "numbers",
  { data_type => "varchar", is_nullable => 1, size => 24 },
  "bonus",
  { data_type => "integer", is_nullable => 1 },
  "draw_date",
  { data_type => "date", datetime_undef_if_invalid => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</draw_no>

=back

=cut

__PACKAGE__->set_primary_key("draw_no");


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-06-07 11:28:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QHbgG/nRNVTqKsaLNW96TA


=head num_str

Strip spaces from the numbers string and replace with dashes

=cut

sub num_str {
	my($self) = @_;
	
	my $temp = $self->numbers;
	$temp =~ s/ / - /g;
	$temp =~ s/-//; #strip first dash
	
	return $temp;
}

# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
