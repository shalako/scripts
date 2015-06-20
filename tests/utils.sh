#
# Utility functions for a tiny test framework - Marco N. 6/18/15
#
date_string () {
    datestr=$(date "+%m-%d-%Y_%H:%M:%S")
    if [ ! $? ]; then echo "ERROR: Failed to get datetime"; exit 1; fi
}

stringP () {
    if [ -z $1 ]; then $?=0; else $?=1; fi
}

prep_tmpdir () {
    date_string ;
    tmpdir="/tmp/tests_${datestr}_$$"
    mkdir $tmpdir
}

mk_tmpfile () {
    date_string ;
    tmpfile="/tmp/tests_${datestr}_$$.t"
    if [ -e $tmpfile ]; then rm $tmpfile; fi
    touch $tmpfile
}
