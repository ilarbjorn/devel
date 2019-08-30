#!/bin/sh
#
# Sets up a development environment the way I want it. 
#
#
# Author: Björn Sjöberg, bjorn@willaiboda.se

# SETTINGS
# Do customize. 
devel_env="github" # Set default devel environment, override with -m
git_account="ilarbjorn"
git_url="git@github.com:$git_account"

# Local file system locations
base_dir="$HOME/devel"
skel_dir="$base_dir/skel"
git_dir="$base_dir/github.com/$git_account" 
local_dir="$base_dir/local" 

# USAGE
usage="Usage: $0 [-m mode] -t type -n name

    [-m mode]           Type of environment to create, overrides config
    -t type             Type of project, corresponds to folders under skel/
    -n name             Project name for Github repository/local project"

# Parse command line
OPTIND=1
while getopts ":ht:n:m:" opt; do
    case "$opt" in
    h)
        echo "$usage"
        exit 0
        ;;
    t)  project_type="$OPTARG"
        ;;
    n)  name="$OPTARG"
        ;;
    m)  devel_env="$OPTARG"
        ;;
    *)  echo "Invalid option or use of option."
        exit 1
        ;;
    esac
done

# TEST
# Check if at least on option is specified
if [ "$#" -lt 2 ]; then
    echo "$usage"
    exit 1
fi

# Make sure both project type and name are specified
if [ ! -v project_type ] || [ ! -v name ]; then
    echo "You need to specify both type and name."
    exit 1
fi

# Check if skel files exist
if [ ! -d "$skel_dir/$project_type" ]; then
    echo "$skel_dir/$project_type not found. Create directory and add skeleton files."
    exit 1
fi

# MAIN
unset project_dir
# Check project type and setup accordingly
if [ "$devel_env" = "local" ]; then
    project_dir="$local_dir/$name"
    if [ ! -d "$project_dir" ]; then
        echo "Creating $project_dir.."
        mkdir -p "$project_dir"
    fi
    echo "Copying skel files.."
    cp -r "$skel_dir/$project_type/"* "$project_dir"
    echo "Initializing.."
    git init "$project_dir"
    echo "Done."
    exit 0
elif [ "$devel_env" = "github" ]; then
    project_dir="$git_dir/$name"
    if [ ! -d "$project_dir" ]; then
        echo "Creating $project_dir.."
        mkdir -p "$project_dir"
    fi
    echo "Cloning $name to $git_url/$name..."
    git clone "$git_url/$name" "$project_dir"
    echo "Copying skel files.."
    cp -r "$skel_dir/$project_type/"* "$project_dir"
    echo "Done."
    exit 0
fi
