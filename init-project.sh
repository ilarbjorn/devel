#!/bin/sh
#
# Sets up a custom development environment on a workstation, for use with
# Github.com or local files.
#
# Author: Björn Sjöberg, bjorn@willaiboda.se

# SETTINGS
# Do customize. But order matters.
devel_dir="$HOME/devel"
devel_env="github" # Set default devel environment, override with -e
git_account="ilarbjorn"
git_url="git@github.com:$git_account"

# Local file system locations
git_dir="$devel_dir/github.com/$git_account" 
local_dir="$devel_dir/local" 

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
    e)  devel_env="$OPTARG"
        ;;
    *)  echo "Error: invalid option or use of option."
        exit 1
        ;;
    esac
done

# Check if at least on option is specified
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
    echo "skel/$project_type not found. Create directory and add skeleton files."
    exit 1
fi

# MAIN

# Check project type and setup accordingly
if [ "$devel_env" == "local" ]; then
    project_dir="$local_dir/$project"
    if [ ! -d "$project_dir" ]; then
        mkdir -p "$project_dir"
    fi
    cp -r "skel/$project_type/"* "$project_dir"
    cd "$project_dir"
    git init
    exit 0
elif [ "$devel_env" == "github" ]; then
    project_dir="$git_dir/$project"
    if [ ! -d "$project_dir" ]; then
        mkdir -p "$project_dir"
    fi
    cd "$git_dir"
    git clone "$git_url/$project"
    cd $devel_dir
    cp -r "skel/$project_type/"* "$project_dir"
fi
