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

on 'develop' => sub {
	requires Dist::Zilla::Plugin::AutoVersion;
	requires Dist::Zilla::Plugin::Git::Check';
	requires Dist::Zilla::Plugin::MetaNoIndex';
	requires Dist::Zilla::Plugin::NextRelease';
	requires Dist::Zilla::Plugin::PkgVersion';
	requires Dist::Zilla::Plugin::PodWeaver';
	requires Dist::Zilla::Plugin::Test::Perl::Critic';
	requires Dist::Zilla::PluginBundle::Basic
	requires Dist::Zilla::PluginBundle::Git';
	requires Software::License::Perl_5';
};
