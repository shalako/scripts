#!/bin/bash -x
#
# Per feature request, should save files that include the version and build number in the bindir

testsDir=$(cd $(dirname $0); pwd)
bin=$(basename $testsDir)
parentDir=${testsDir%/*}
binDir=${parentDir%/*}

source $parentDir/utils.sh

prep_tmpdir
echo "tmpdir is: $tmpdir"

${binDir}/$bin -x -c ltc -p $tmpdir
${binDir}/$bin -x -c cf -p $tmpdir

failCount=0
# There should be one link pointing to a file with the cli-ver-buildno format
ltcbin=$(readlink $tmpdir/ltc) 
echo $ltcbin | egrep -q -e 'ltc-v[\.0-9]*-[0-9]*$'
if [ 0 -ne $? ]; then
    echo "FAILED: ltc link ($ltcbin) does not point to a binary including build number"
    failCount=$((failCount + 1))
fi

# There should be one link pointing to a file with the cli-ver-SHA format
cfbin=$(readlink $tmpdir/cf) 
echo $cfbin | egrep -q -e 'cf-([.[:digit:]]+)-([[:alnum:]]+)$'

if [ 0 -ne $? ]; then
    echo "FAILED: cf link ($cfbin) does not point to a binary including build SHA"
    failCount=$((failCount + 1))
fi
if [ 0 -eq $failCount ]; then
    rm -r $tmpdir
    exit 0
else
    echo "FAILED with $failCount errors"
    exit $failCount
fi

    
