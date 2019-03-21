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

INSTALLATION
------------

To install from tarball:

    cpan install Dist-Zilla-Plugin-ReleaseToDarkpan-<version>.tar.gz

or

    cpanm Dist-Zilla-Plugin-ReleaseToDarkpan-<version>.tar.gz

BUILD
-----

With [Dist::Zilla](https://metacpan.org/pod/Dist::Zilla):

    cpanm Dist::Zilla
    dzil build

To install directly from project:

    dzil install

To build and install the traditional way:

    tar xf VZW-BMCMap-<version>.tar.gz
    cd VZW-BMCMap-<version>
    perl Makefile.PL
    make
    make test
    make install

RELEASE
-------

    dzil release

DEPENDENCIES
------------

To view dependencies:

    dzil listdeps

To install dependencies:

    dzil listdeps | cpanm

You may have to install DBD::mysql separately.  On MacOS, I had to

    cd /usr/local/lib
    ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib libssl.dylib
    ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib libcrypto.dylib

MAINTAIN
--------

To update cpanfile:

    cpanm scan-prereqs-cpanfile
    scan-prereqs-cpanfile > cpanfile

To update authordeps:

    scan-prereqs-cpanfile authordeps

and edit the output to paste into the generated cpanfile.
See (cpanfile documentation)[https://metacpan.org/pod/cpanfile].

AUTHOR
------

Lawrence Siden <lsiden@gmail.com>

COPYRIGHT AND LICENSE
----------------------

This software is copyright (c) 2019 by Lawrence Siden.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.


