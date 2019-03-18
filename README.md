Dist::Zilla::Plugin::ReleaseToDarkpan
======================================

[Dist::Zilla](http://dzil.org/) plugin to release a Perl module to a local directory structured to mimick CPAN, also called a "darkpan".

Description
===========

Sometimes we create a Perl module for our private use that we are not ready or not able to release to CPAN.  The utility [cpan-mirror-tiny](https://metacpan.org/pod/distribution/CPAN-Mirror-Tiny/script/cpan-mirror-tiny) lets us create a private CPAN repositoy on our local filesystem to store such packages we can then use in our own projects.

This plugin gives you the ability to automate this task when you run "dzil release".  Use this plugin instead of [UploadToCPAN](https://metacpan.org/pod/Dist::Zilla::Plugin::UploadToCPAN).

Usage
=====

In dist.ini:

	[ReleaseToDarkpan]
	darkpan => '~/darkpan'
	create_if_missing => 0
