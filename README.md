Devel
======

Sets up a custom development environment on a workstation, for use with Github.com or local files. 

## Getting started

_Note: When running in Github mode you __will need__ an empty repository with "name" already created on your Github account._

1. Clone this repository.
2. Edit init-projects.sh and .gitignore to apply proper configuration.
3. Run `init-project.sh --help`
```
Usage: ./init-project.sh [-m mode] -t type -n name

    [-m mode]           Type of environment to create, overrides config
    -t type             Type of project, corresponds to folders under skel/
    -n name             Project name for Github repository/local project
```
4. Create your project, ie `init-project.sh -n MyProject -t shell`

That would give you something like this:

```
devel
├── .git
├── .gitignore
├── LICENSE
├── README.md
├── github.com
│   └── $git_account
│       └── MyProject
│           ├── .git
│           ├── LICENSE
│           ├── README.md
│           └── main.sh
├── init-project.sh
├── local
│   └── $project_type
│      └── MyProject
│          ├── .git
│          └── main.sh
└── skel
    └── shell
        └── main.sh
```

### Notes
* In local mode it just sets up the directories.
* In Github mode it sets up the directories and clone the project into that folder.
