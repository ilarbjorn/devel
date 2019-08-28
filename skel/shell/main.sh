#!/bin/sh
#
# DESCRIPTION
#
# Author: Björn Sjöberg, bjorn@willaiboda.se

# SETTINGS
option=""

# USAGE
usage="Usage: $0 [-h]
    [-h]    Shows this help"

# Parse command line
OPTIND=1
while getopts ":h" opt; do
    case "$opt" in
    h)
        echo "$usage"
        exit 0
        ;;
    *)  echo "$usage"
        exit 1
        ;;
    esac
done
