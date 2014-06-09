#!/bin/sh
# Author: Melv Kim <melvkim@gmail.com>
# Project Home: https://github.com/melvkim/melvable
set -e
DIR_MELVABLE_IMAGE=""
FULL_USAGE='Example usage:
    melvable list
    melvable install IMAGE_NAME
    melvable help
    melvable env
'
INSTALL_INSTRUCTIONS='melvable is not found.
To install melvable, visit:
https://github.com/melvkim/melvable'

check_requirements() {
    # Check if melvable directory variable is set
    if [ -z "${DIR_MELVABLE}" ]; then
        DIR_MELVABLE=~/.melvable
        DIR_MELVABLE_IMAGE="${DIR_MELVABLE}/image"
    fi
    
    # Die if melvable directory is not found
    if [ ! -d "${DIR_MELVABLE}" ]; then
        die "${INSTALL_INSTRUCTIONS}"
    fi
}


parse_user_args() {
    case "$#" in
        0)
            print_usage
            die "Enter arguments."
            ;;
        1)
            case "$1" in
                list)
                    list_image
                    ;;
                help|--help|-h)
                    print_usage
                    ;;
                env)
                    print_env
                    ;;
                *)
                    print_usage
                    die "Unable to parse arguments. Consult 'melvable help' for usage."
                    ;;
            esac
            ;;
        2)
            case "$1" in
                install)
                    if [ -f "$2" ]; then
                        install_image "$2"
                    else
                        die "Unable to locate the image, $2"
                    fi
                    ;;
                *)
                    print_usage
                    die "Unable to parse arguments. Consult 'melvable help' for usage."
                    ;;
            esac
            ;;
        *)
            die "Too many arguments. Consult 'melvable help' for usage."
            ;;
    esac
}

install_image() {
    command "${DIR_MELVABLE_IMAGE}/{$1}"
}

list_image() {
    for image_file in ${DIR_MELVABLE_IMAGE}/*
    do
        command basename "$image_file"
    done
}

print_env() {
    echo "DIR_MELVABLE: $DIR_MELVABLE"
}

print_usage() {
    echo "${FULL_USAGE}"
}

die() {
    echo "ERROR: $1"
    exit 1
}
# main
check_requirements
echo "$DIR_MELVABLE is dir melvable"
parse_user_args "$@"
