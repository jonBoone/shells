#!/bin/sh
#
# link shell resource files
#

# unless passed as the first command line argument, PATH_TO_REPO should be ${HOME}
PATH_TO_REPO="${1:-$HOME}"
echo "source files are located in ${PATH_TO_REPO}"
echo "links are being made in ${HOME}"

# create the base link
ln -s "${PATH_TO_REPO}/shell" "${HOME}/.shell"

# add bash support
ln -s "${PATH_TO_REPO}/bash" "${HOME}/.bash"
ln -s "${HOME}/.bash/bashrc" "${HOME}/.bashrc"
ln -s "${HOME}/.bash/logout" "${HOME}/.bash_logout"
ln -s "${HOME}/.bash/bash_profile" "${HOME}/.bash_profile"

# add sh support
ln -s "${PATH_TO_REPO}/sh" "${HOME}/.sh"
ln -s "${HOME}/.sh/profile" "${HOME}/.profile"

# add zsh support
ln -s "${PATH_TO_REPO}/zsh" "${HOME}/.zsh"
ln -s "${HOME}/.zsh/interactive" "${HOME}/.zshrc"
ln -s "${HOME}/.zsh/profile" "${HOME}/.zprofile"
ln -s "${HOME}/.zsh/env" "${HOME}/.zshenv"
ln -s "${HOME}/.zsh/login" "${HOME}/.zlogin"
ln -s "${HOME}/.zsh/logout" "${HOME}/.zlogout"

# add prezto support
ln -s "${HOME}/.zprezto/runcoms/zpreztorc" "${HOME}/.zpreztorc"