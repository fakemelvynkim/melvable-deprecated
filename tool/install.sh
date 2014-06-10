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
     echo "melvable exists in ${DIR_MELVABLE}"
     read -p "Do you wish to re-install melvable? [Y]es/[N]o: \c" prompt_yes_or_no
     case $prompt_yes_or_no in 
        [Yy]*) 
            "Removing existing melvable directory.."
            rm -rf ${DIR_MELVABLE}
            "Cloning melvable.."
            wget --quiet --no-check-certificate https://raw.github.com/melvkim/melvable/master/tool/install.sh -O - | sh
            ;;
        [Nn]*)
            die_on_warning "Melvable not installed."
            ;;
        *)
            die "Enter 'Yes' or 'No'"
            ;;
     esac
  fi
}

clone_melvable() {
  echo "Cloning melvable to ${DIR_MELVABLE}.."
  hash git >/dev/null 2>&1 && /usr/bin/env  git clone --quiet --recursive "https://github.com/melvkim/melvable" ${DIR_MELVABLE} || 
  die "git is not installed."
}

add_symbolic_link() {
  if test -h "/usr/local/bin/melvable"; then
    echo "Replacing melvable symbolic link.."
    sudo rm "/usr/local/bin/melvable"
  fi
  sudo ln -s "${DIR_MELVABLE}/tool/melvable.sh" "/usr/local/bin/melvable"
}

add_variable_to_shell_resource() {
  local SHELL_RC=""
  
  echo "Adding variables to shell resource.."
  
  if test -n "$(echo "${SHELL}" | grep zsh)"; then
    SHELL_RC=".zshrc"
  elif test -n "$(echo "${SHELL}" | grep bash)"; then
    SHELL_RC=".bashrc"
  else
    echo "Your shell is not recognized. Add the following line in your resource file manually:"
    echo "DIR_MELVABLE=\"${DIR_MELVABLE}\""
    return
  fi
  
  # Return if $DIR_MELVABLE is already added to resource file
  if test -n "$(grep 'DIR_MELVABLE' "${HOME}/${SHELL_RC}")"; then
    return
  fi

  # Add variable to shell resource file
  echo "DIR_MELVABLE=\"${DIR_MELVABLE}\"" >> "${HOME}/${SHELL_RC}"
  . "${HOME}/${SHELL_RC}"
}

display_welcome() {
  echo "melvable is successfully installed."
  echo "Available images to install are:"
  \ls "${DIR_MELVABLE}/image"
}

die_on_warning() {
    echo "WARNING: $1"
    exit 2
    
}
die() {
    echo "ERROR: $1"
    exit 1
}

# main
check_requirements
clone_melvable
add_symbolic_link
add_variable_to_shell_resource
display_welcome
