#!/bin/bash
#
# A trivial test harness
# - Just run each of the files named test_ in a subdirectory specified
# - NOTE: The name of the subdirectory should be the filename of the app to be tested
#
testsDir=$(cd $(dirname $0); pwd)

source $testsDir/utils.sh

if [ 0 = $# ]; then
    echo "Usage: $0 testsuite_dir [testsuite_dir ...]"
    echo "       Note: testsuite_dir should be the same filename as the app to be tested."
    exit 1
fi

echo "Performing tests on: $*" ; echo

overall_status=0
for d in $*; do
    echo "Running tests in $d"
    if [ ! -d $d ]; then echo "Not a test directory: $d"; exit 1; fi
    err_count=0

    for i in $d/test_* ; do
        echo "- ${i}"
        mk_tmpfile
        $i > $tmpfile 2>&1
        err=$?
        if [ 0 -ne $err ]; then
            echo "FAILED: $i. Output in: $tmpfile"
            err_count=$((err_count + 1))
            overall_status=$((overall_status + 1))
        else
            rm $tmpfile
        fi
    done

    if [ 0 -eq $err_count ]; then
        echo "Succeeded."
        # exit 0
    else
        echo "Failed with $err_count errors."
        # exit $err_count
    fi
done

echo ; echo 
if [ 0 -eq $overall_status ]; then
    echo "OVERALL: Succeeded!"
    exit 0
else
    echo "OVERALL: Failed with $overall_status errors."
    exit $overall_status
fi

    
