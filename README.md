# Devel

Sets up a custom development environment on a workstation, for use with Github.com or local files.

## Getting started

Note: Unless running in local mode, you will need an empty repository with "name" already created on your Github account.

1. Clone this repository.
2. Edit init-projects.sh and apply proper configuration.
3. Run `init-project.sh --help`
```
Usage: ./init-project.sh [-e environment] -t type -p name

    [-e environment]    Type of environment to create, ie local or github
    -t type             Type of project, corresponds to folders under skel/
    -p name             Project name for Github repository/local project
```
4. Create your project, ie `init-project.sh -p name -t type`

This will give you something like this:

```
devel
├── LICENSE
├── README.md
├── github.com
│   └── $git_account
│       └── $project
│           ├── .git
│           ├── LICENSE
│           ├── README.md
│           └── main.sh
├── init-project.sh
├── local
│   └── project
│       ├── .git
│       └── main.sh
└── skel
    └── shell
            └── main.sh
```
