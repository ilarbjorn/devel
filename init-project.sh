#!/bin/env bash
#
# Sets up a custom development environment on a workstation, for use with
# Github.com or local files.
#
# Author: Björn Sjöberg, bjorn@willaiboda.se

# Settings, do customize
git_account="ilarbjorn"
giturl="git@github.com:$git_account"

# File system location for projects
gitfolder="github.com/$git_account"
localfolder="local"

# Print usage information
usage="Usage: $0 [-hl] -t <project_type> -n <name>

  [-h]                  Show this help message
  [-l]                  Make this a local project, default is Github
  -t <project_type>     Type of project, corresponds to folders under skel/
  -n <name>             Name of the Github repository/local project"

# Parse command line
OPTIND=1
while getopts ":hlt:n:" option "$@" ; do
    case "$option" in
        ( h ) echo "$usage" && exit 2;; # TODO exit code?
        ( l ) is_local="True";; # TODO bad variable name
        ( t ) project_type="$OPTARG";;
        ( n ) project="$OPTARG";;
        ( * ) echo "$usage";;
    esac
done

# TODO: 
# Make this a function init_project(type)
if [ -d "$skel/$type" ]; then
    if [ "$is_local" ]; then # TODO
        if [ ! -d "$localfolder/$project" ]; then
            echo "mkdir -p $localfolder/$project"
        fi
        echo "cp -r skel/$type -> $localfolder/$project"
    else
        if [ ! -d "$gitfolder/$project" ]; then
            echo "mkdir -p $gitfolder/$project"
        fi
        echo "cp -r skel/$type -> $gitfolder/$project"
    fi
else
    echo "No such skeleton files, unsupported type"
fi

# _MAIN_
# init_project($project_type)
