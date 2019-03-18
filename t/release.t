use strict;
use warnings;

use Data::Dumper;
use Test::More;
use Test::DZil;
use File::Basename;

use lib dirname(__FILE__) . '/../lib';
use Dist::Zilla::Plugin::ReleaseToDarkpan;

my $tzil = Builder->from_config(
    { dist_root => 'test-corpus/DZT' },
    {   add_files => {
            'source/dist.ini' => simple_ini(
                'GatherDir',
                [ ReleaseToDarkpan => { darkpan => './test-darkpan', } ]
            )
        },
    }
);

$tzil->build;
$tzil->release;
ok( -f './test-darkpan' );

done_testing;
