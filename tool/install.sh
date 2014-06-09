#!/bin/sh
# Author: Melv Kim <melvkim@gmail.com>
# Project Home: https://github.com/melvkim/melvable
set -e

check_requirements() {
  # Check if melvable directory variable is set 
  if [ ! -n "${DIR_MELVABLE}" ]; then
      DIR_MELVABLE=~/.melvable
  fi

  # Die if melvable directoy exists 
  if [ -d "${DIR_MELVABLE}" ]; then
      die "melvable exists in ${DIR_MELVABLE}"
  fi
}

clone_melvable() {
  echo "Cloning melvable to ${DIR_MELVABLE}"
  hash git >/dev/null 2>&1 && /usr/bin/env  git clone --recursive "https://github.com/melvkim/melvable" ${DIR_MELVABLE} || 
  die "git is not installed."
}

add_symbolic_link() {
  if -h "/usr/local/bin/melvable"; then
    echo "Replacing melvable symbolic link.."
    rm "/usr/local/bin/melvable"
  fi
  ln -s "${DIR_MELVABLE}/tool/melvable.sh" "/usr/local/bin/melvable"
}

display_welcome() {
  echo "melvable is successfully installed."
  echo "Available image lists from ${DIR_MELVABLE}/image/ are:"
  \ls ${DIR_MELVABLE} 
}

die() {
    echo "ERROR: $1"
    exit
}

# main
check_requirements
clone_melvable
add_symbolic_link
display_welcome
