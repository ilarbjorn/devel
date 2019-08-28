# Devel

Sets up a custom development environment on a workstation, for use with Github.com or local files.

## Getting started

Note: Unless running in local mode, you will need an empty repository with $projectname already created on your Github account.

1. Clone this repository into $HOME/devel or other preferred folder.
2. Edit init-projects.sh and apply proper configuration.
3. Run `init-project.sh --help` and then re-run with the wanted flags, ie: `init-project.sh -p project_name -t type`

You will then have the following structure:

```
.
├── LICENSE
├── README.md
├── github.com
│   └── $git_account
        └── $project_name
            └── * skeleton files of $type
├── init-project.sh
├── local
        └── $project_name
            └── * skeleton files of $type
└── skel
    └── shell
        └── main.sh
```
