use utf8;
package Lottery::Schema::Result::Single;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Lottery::Schema::Result::Single

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

=head1 TABLE: C<singles>

=cut

__PACKAGE__->table("singles");

=head1 ACCESSORS

=head2 numbers

  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 appearances

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "numbers",
  { data_type => "varchar", is_nullable => 1, size => 20 },
  "appearances",
  { data_type => "integer", is_nullable => 1 },
);


# Created by DBIx::Class::Schema::Loader v0.07042 @ 2015-06-07 11:28:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wf1Rv7bhilQVIqAJWkX7kw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
