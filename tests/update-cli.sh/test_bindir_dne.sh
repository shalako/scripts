#!/bin/bash
#
# Default test - does it do the right thing if the bin dir does not exist?

testsDir=$(cd $(dirname $0); pwd)
bin=$(basename $testsDir)
parentDir=${testsDir%/*}
binDir=${parentDir%/*}

source $parentDir/utils.sh

prep_tmpdir
echo "tmpdir is: $tmpdir"

${binDir}/$bin -x -c ltc -p /tmp/THIS_DIRECTORY_DOES_NOT_EXIST.$$

exit_code=$?

# We'll never need to inspect the tmpdir
rm -r $tmpdir

if [ 0 -ne $exit_code ]; then
    exit 0;
else
    echo "FAILED: Expected non-zero exit code."
    exit 1
fi
