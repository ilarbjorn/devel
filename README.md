# Devel

Sets up a custom development environment on workstation, for use with Gitlab.com (default) or for local files.

## Getting started

Note: Unless running in local mode, you will need an empty repository with $projectname already created on your Github account.

1. Clone this repository into $HOME/devel or other preferred folder.
2. Edit init-projects.sh and apply proper configuration.
3. Run `init-project.sh --help` and then re-run with the wanted flags, ie: `init-project.sh projectname -t shell`

You will then have the following structure:

```
.
├── .gitignore
├── github.com
│   └── $your_git_account
│       └── projectname
│           └── projectname.sh
├── init-project.sh
├── local
└── skel
    └── shell.sh
```
