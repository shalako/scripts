#!/bin/sh

testsDir=$(cd $(dirname $0); pwd)
bin=$(basename $testsDir)
parentDir=${testsDir%/*}
binDir=${parentDir%/*}

source $parentDir/utils.sh

prep_tmpdir
echo "tmpdir is $tmpdir"

${binDir}/$bin -xp $tmpdir -u file://not-there

# We'll never need to inspect the tmpdir
rm -r $tmpdir

if [ 0 -ne $? ]; then
    exit 0;
else
    echo "FAILED: Expected non-zero exit code."
fi
