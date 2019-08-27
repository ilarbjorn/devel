#!/bin/sh
#
# Init a already created Github repository with skel files based upon project
# type.
#
# Author: Björn Sjöberg, bjorn@willaiboda.se

# Settings
$git_account="ilarbjorn"
$giturl="https://github.com/$git_account"
$gitfolder="github.com/$git_account"

# Parse command line
# case $apptype
# if shell; then
#       cat skel/type > github.com/$git_account/$project/project.sh
# fi
$project="$@ arg"
$apptype="shell, python, tex etc. etc."

# Setup files
if [! -d $gitfolder ]; then
    mkdir -p $gitfolder
fi

cd $gitfolder
git clone $project
