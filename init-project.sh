#!/bin/sh
#
# Sets up a custom development environment on a workstation, for use with
# Github.com or local files.
#
# Author: Björn Sjöberg, bjorn@willaiboda.se

# SETTINGS
# Do customize.
devel_dir="$HOME/devel"
devel_type="github" # [ local | github ]
local_dir="local" # file system location
git_account="ilarbjorn"
git_url="git@github.com:$git_account"
git_dir="github.com/$git_account" # file system location

# USAGE
usage="Usage: $0 [-e environment] -t type -p name

    [-e environment]    Type of environment to create, ie local or github
    -t type             Type of project, corresponds to folders under skel/
    -p name             Project name for Github repository/local project"

# Parse command line
OPTIND=1
while getopts ":ht:p:e:" opt; do
    case "$opt" in
    h)
        echo "$usage"
        exit 0
        ;;
    t)  project_type="$OPTARG"
        ;;
    p)  project="$OPTARG"
        ;;
    e)  devel_type="$OPTARG"
        ;;
    *)  echo "Error: invalid option or use of option."
        exit 1
        ;;
    esac
done

# Check valid use
if [ "$#" -lt 2 ]; then
    echo "$usage"
    exit 1
fi

# Make sure both project type and name are specified
if [ "x$project_type" == "x" ] || [ "x$project" == "x" ]; then
    echo "Error: you need to specify both type and name."
    exit 1
fi

# Check if skel files exist
if [ ! -d "skel/$project_type" ]; then
    echo "skel/$project_type not found. Please, create dir and add skeleton files."
    exit 1
fi

# MAIN

# Check project type and setup accordingly
if [ "$devel_type" == "local" ]; then
    if [ ! -d "$local_dir/$project" ]; then
        mkdir -p "$local_dir/$project"
    fi
    cp -r "skel/$project_type/"* "$local_dir/$project"
    cd "$local_dir/$project"
    git init
elif [ "$devel_type" == "github" ]; then
    if [ ! -d "$git_dir/$project" ]; then
        mkdir -p "$git_dir/$project"
    fi
    cd "$git_dir"
    git clone "$git_url/$project"
    cd $devel_dir
    cp -r "skel/$project_type/"* "$git_dir/$project"
fi
