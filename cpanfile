requires 'CPAN::Mirror::Tiny';
requires 'Dist::Zilla::Role::BeforeRelease';
requires 'Dist::Zilla::Role::Releaser';
requires 'Moose';
requires 'Test::Perl::Critic';

on configure => sub {
    requires 'ExtUtils::MakeMaker';
};

on test => sub {
    requires 'Test::DZil';
    requires 'Test::More';
};
