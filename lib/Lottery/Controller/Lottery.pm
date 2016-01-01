package Lottery::Controller::Lottery;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller'; }

=head1 NAME

Lottery::Controller::Lottery - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.
Lottery.pm 07/06/15
v1.01 08/12/15 (using URI plugin)

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path Args(0) {
    my ( $self, $c ) = @_;
	
	$c->response->redirect ($c->uri("Lottery.home"));
#	$c->response->redirect ($c->uri_for ($self->action_for ('home')));
}

sub home :Path('home') Args(0) {
	my ($self, $c) = @_;

	$c->stash ( template => 'Home.tt2');
}

sub showAll :Path('showAll') Args(0) {
	my ($self, $c) = @_;

	$c->stash ( template => 'ShowAll.tt2',
				data => [ $c->model ('DB::Number')
							->order_by ('draw_date','desc'),
						],
	);
}

sub singles :Path('singles') Args(0) {
	my ($self, $c) = @_;

	$c->stash (	template => 'Combinations.tt2',
				caller => 'Singles',
				data => [ $c->model ('DB::Single')
							->order_by ('appearances','desc'),
						],
	);
}

sub doubles :Path('doubles') Args(0) {
	my ($self, $c) = @_;

	$c->stash (	template => 'Combinations.tt2',
				caller => 'Doubles',
				data => [ $c->model ('DB::Double')
							->order_by ('appearances','desc'),
						],
	);
}

sub triples :Path('triples') Args(0) {
	my ($self, $c) = @_;

	$c->stash ( template => 'Combinations.tt2',
				caller => 'Triples',
				data => [ $c->model ('DB::Triple')
							->order_by ('appearances','desc'),
						],
				
	);
}

sub quads :Path('quads') Args(0) {
	my ($self, $c) = @_;

	$c->stash ( template => 'Combinations.tt2',
				caller => 'Quadruples',
				data => [ $c->model ('DB::Quadruple')
							->order_by ('appearances','desc'),
						],
				);
}

sub check :Path('check') Args(0) {
	my ($self, $c) = @_;

	$c->stash (	template => 'Combinations.tt2',
				caller => 'Check My Numbers',
				data => $c->model ('DB::Number')
						  ->check_my_numbers,
				);
}

=encoding utf8

=head1 AUTHOR

A clever guy

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
