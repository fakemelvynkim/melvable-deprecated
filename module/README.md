# Sample module file structure

Always include README.md in each modules.

    module/
    └── ubuntu_1404/
    │   ├── README.md
    │   └── ubuntu_1404_64bit_mac.melvablesrc
    │   └── ubuntu_1404_64bit.melvablesrc
    └── ubuntu_1204/
        ├── README.md
        └── ubuntu_1204_64bit.melvablesrc

# Sample module::function naming convention

1. Use CamelCase with very expressive terms (no abbr. plz).

        # e.g.
        Initialize() {
            ...
            ...
        }


2. Add suffix, `Tall`, `Grande`, `Venti`, if necessary. 

    `Tall`: Minimum install mode. Only install core binaries which are absolutely necessary to run.

    `Grande`: Moderate install mode. Most commonly used installation mode. Various combination of Grande makes up different images.

    `Venti`: Full install mode. Install all available binaries, configurations, etc.

 
        # e.g.
        InstallDevelopGrande() {
            ...
            ...
        }

# TODO

1. SIMPLIFY `apt-get install -y` by adding a function which receives the argument as its package name.
2. DIFFERENCIATE installs requiring user prompt from the rest (e.g. java install) 