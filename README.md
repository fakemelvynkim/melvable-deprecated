# melvable

**melvable** is a fully customizable installation script for debian-based systems, either on your freshly-formatted computer or on your VMWare clone. Please check [Disclaimer](#disclaimer) section below before use.

If you're looking for a similar project for Windows operating system, check out [ninite](https://ninite.com/).

# Quick Guide 

1. Install melvable.

        wget --quiet --no-check-certificate https://raw.github.com/melvkim/melvable/master/tool/install.sh -O - | sh

    For more installation options, refer to [Installation](#installation) section below.

2. Get list of script images. 
    
        melvable list

3. Execute melvable with an image.

        # e.g.
        melvable install ubuntu_1404_tall

# Installation

### default path (recommended)

#### via `curl`

    curl --silent -L https://raw.github.com/melvkim/melvable/master/tool/install.sh | sh

#### via `wget`

    wget --quiet --no-check-certificate https://raw.github.com/melvkim/melvable/master/tool/install.sh -O - | sh


### custom path

#### via `curl`

Replace `"/full/path/to/melvable"` to your desired path:

    DIR_MELVABLE="/full/path/to/melvable" && curl -L https://raw.github.com/melvkim/melvable/master/tool/install.sh | sh

#### via `wget`
    
Replace `"/full/path/to/melvable"` to your desired path:

    DIR_MELVABLE="/full/path/to/melvable" && get --no-check-certificate https://raw.github.com/melvkim/melvable/master/tool/install.sh -O - | sh

# TODO
3. ADD `melvable list` function
1. ADD `tool/uninstall.sh`
2. DIFFERENTIATE functions in `module/ubuntu`


# Disclaimer

**melvable** is targetted for and tested only on Ubuntu 14.04 LTS 64 Bit, to create VMWare images.
