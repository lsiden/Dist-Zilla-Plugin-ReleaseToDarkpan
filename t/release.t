use strict;
use warnings;

use Data::Dumper;
use Test::More;
use Test::DZil;
use File::Basename;

use lib dirname(__FILE__) . '/../lib';
use Dist::Zilla::Plugin::ReleaseToDarkpan;

use constant {
	DARKPAN => '/tmp/test-darkpan',
};

my $tzil = Builder->from_config(
    { dist_root => 'test-corpus/DZT' },
    {   add_files => {
            'source/dist.ini' => simple_ini(
                'GatherDir',
                [   ReleaseToDarkpan => {
                        darkpan           => DARKPAN,
                        create_if_missing => 1,
                    }
                ]
            )
        },
    }
);

if (-d DARKPAN) {
	unlink DARKPAN
}
	
$tzil->release;
ok( -d DARKPAN );

done_testing;
