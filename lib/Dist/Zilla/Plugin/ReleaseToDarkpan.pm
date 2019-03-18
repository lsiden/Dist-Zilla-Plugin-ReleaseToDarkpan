#PODNAME Dist::Zilla::Plugin::ReleaseToDarkpan
#ABSTRACT Plugin to release module to a local darkpan directory.

=pod

=head1 SYNOPSIS

In dist.ini

    [ReleaseToDarkpan]
    dir=path/to/darkpan ; default ~/.darkpan
    
=cut

use strict;
use warnings;
package Dist::Zilla::Plugin::ReleaseToDarkpan;

use Moose;
with qw(Dist::Zilla::Role::Releaser);

use CPAN::Mirror::Tiny;

has 'darkpan' => (
	is => 'ro',
	isa => 'Str',
	default => '~/darkpan',
);

sub release {
	my ($self, $archive) = @_;
	warn 'release;';
	warn $archive;
	warn $self->darkpan;
}

1;
