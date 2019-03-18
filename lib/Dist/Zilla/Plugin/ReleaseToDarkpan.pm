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
with qw(Dist::Zilla::Role::BeforeRelease Dist::Zilla::Role::Releaser);

use CPAN::Mirror::Tiny;
use Cwd;

has 'darkpan' => (
    is      => 'ro',
    isa     => 'Str',
    default => '~/darkpan',
);

has 'create_if_missing' => (
    is      => 'ro',
    isa     => 'Int',
    default => 0,
);

sub before_release {
    my ( $self, $archive ) = @_;

    if ( $self->create_if_missing && !-d $self->darkpan ) {
            mkdir $self->darkpan, 0775
            or die "@{[$self->darkpan]}: $!";
        print STDERR "mkdir @{[$self->darkpan]}\n";
    }
}

sub release {
    my ( $self, $archive ) = @_;
    my $cpan = CPAN::Mirror::Tiny->new( base => $self->darkpan );
    $cpan->inject($archive);
    $cpan->write_index;
}

1;
