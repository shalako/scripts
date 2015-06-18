#! /bin/bash

# DEFAULTS
cli="cf"
rel=1
bindir="/usr/local/bin"

usage="\
$0  Download and update a new version of a binary.

    Overwrites binaries that have the same semantic version (ie, new
    builds of the same release). Symlinks the binary name to the
    version requested (stable or edge). If the fresh binary is a new
    version, this script will symlink the currently installed version
    to [binary].old.

Options:
    -h                This help
    -c cf|ltc         Specify cf or ltc CLI (defaults to unstable release)
    -r stable|edge    Specify stable (release) or edge (unstable) release
    -p bindir         Specify the target directory to install the binary
                      (Defaults to: $bindir)
    -x                Debug mode
"

## Changelog
# Knows URIs for cf and ltc binaries
# Allows user to specify stable or edge
# Now saves previous semvers as .old, overwrites new builds of current semver
# Logic to make filenames include semver and symlink binary and binary.old
# Used $OSTYPE to auto-choose correct version # FIXME: Windows??
# Added getopt to process command line args, also usage help text
# Switched from wget to curl, since OSX doesn't ship with wget
# When downloading CF, identify source as "internal" (vs github)

# Format is OS_CLI(Release Unstable)
darwin_CF=("https://cli.run.pivotal.io/stable?release=macosx64-binary&source=internal" "https://cli.run.pivotal.io/edge?arch=macosx64&source=internal")
# Assuming 64 bit versions only
linux_CF=("https://cli.run.pivotal.io/stable?release=linux64-binary&source=internal" "https://cli.run.pivotal.io/edge?arch=linux64&source=internal")
windows_CF=("https://cli.run.pivotal.io/stable?release=windows64-exe&source=internal" "https://cli.run.pivotal.io/edge?arch=windows64&source=internal")
#
darwin_LTC=("https://lattice.s3.amazonaws.com/releases/latest/darwin-amd64/ltc" "https://lattice.s3.amazonaws.com/unstable/latest/darwin-amd64/ltc")
linux_LTC=("https://lattice.s3.amazonaws.com/releases/latest/linux-amd64/ltc" "https://lattice.s3.amazonaws.com/unstable/latest/linux-amd64/ltc")
windows_LTC=("/bin/false" "/bin/false")

####

# Call like this: getver dir binary
getver () {
    if [ -e ${1}/$2 ]; then
        current_ver=`${1}/$2 -v`
        short=${current_ver##*$2 version }
        version=${short/-*}
    else
        version="N/A"
    fi
}

download () {
    curl -sL $1 > /tmp/$2-$$.bin
    if [ 0 -ne $? ]; then
        echo "Error downloading CLI. Aborting."
        exit -1
    fi
}

relink () {
    if [ "$cur_version"X != "N/AX" -a "$cur_version"X != "$new_version"X ] ; then
        # If new version, overwrite any .old.
        if [ ! -L ${bindir}/$cli ] ; then 
            mv ${bindir}/$cli ${bindir}/${cli}-$cur_version
        fi
        if [ -e ${bindir}/${cli}.old ] ; then rm $bindir/${cli}.old; fi
        ln -s $bindir/${cli}-$cur_version $bindir/${cli}.old
        old_version=$cur_version
    fi
    
    if [ -e ${bindir}/$cli -a ! -L ${bindir}/$cli ]; then mv ${bindir}/$cli ${bindir}/${cli}-$cur_version; fi
    if [ -e ${bindir}/$cli ] ; then rm ${bindir}/$cli; fi
    mv $cli ${bindir}/${cli}-$new_version
    ln -s ${bindir}/${cli}-$new_version ${bindir}/$cli
}

args=`getopt xnhr:c:p: $*`; errcode=$?; set -- $args
if [ 0 -ne $errcode ]; then echo ; echo "$usage" ; exit $errcode ; fi

for i ; do
    case $i in
        -h)
            echo "$usage"
            exit 0 ;;
        -x)
            echo "Debug mode."
            set -x ; shift ;;
        -r)
            case "$2" in
                release|stable)
                    rel=0 ;;
                edge|unstable)
                    rel=1 ;;
                *)
                    echo "Error: release must be stable or edge."
                    exit 1
                    ;;
            esac
            shift; shift ;;
        -c)
            case "$2" in
                cf)
                    cli="cf" ;;
                ltc)
                    cli="ltc" ;;
                *)
                    echo "Error: cli must be either cf or ltc."
                    exit 1
                    ;;
            esac
            shift ; shift ;;
        -p)
            bindir="$2"
            shift ; shift ;;
        --)
            shift ; break ;;
    esac
done    

case $OSTYPE in
    darwin*)
        os="darwin"
        if [ "cf" == $cli ] ; then cli_uri=${darwin_CF[rel]}; fi
        if [ "ltc" == $cli ] ; then cli_uri=${darwin_LTC[rel]}; fi
        ;;
    linux*)
        os="linux"
        if [ "cf" == $cli ] ; then cli_uri=${linux_CF[rel]}; fi
        if [ "ltc" == $cli ] ; then cli_url=${linux_LTC[rel]}; fi
        ;;
    *)
        os="windows"
        if [ "cf" == $cli ] ; then cli_uri=${linux_CF[rel]}; fi
        if [ "ltc" == $cli ] ; then echo "Windows not supported by LTC" ; exit 1 ; fi
esac

# Save off old version, if any
if [ -e $bindir/${cli}.old ] ; then
    getver $bindir ${cli}.old
    old_version=$version
else
    old_version="N/A"
fi
    
echo "Downloading $cli_uri"
cd /tmp
case $cli in
    cf)
        getver ${bindir} cf
        cur_version=$version
        download $cli_uri $cli
        tar xf cf-$$.bin
        getver . cf
        new_version=$version
        ;;
    ltc)
        getver ${bindir} ltc
        cur_version=$version
        download $cli_uri $cli
        mv $cli-$$.bin $cli
        chmod a+rx $cli
        getver . ltc
        new_version=$version
        ;;
esac

echo "Installing in $bindir"
relink

if [ "$old_version"X != "N/AX" ]; then echo "Old: ${old_version}: ${bindir}/${cli}.old"; fi
echo "New: ${new_version}: ${bindir}/${cli}"
