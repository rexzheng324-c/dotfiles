#!/bin/bash

set -e
set -v

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# NeoVim
pip3 install neovim

# Git
pip3 install gitlint

# bash
# sudo apt-get install -y shellcheck
~/.vim/setup/install_shfmt.sh

# Python
pip3 install yapf isort ipython pylint flake8

# C/C++
~/.vim/setup/install_clang_format.sh
~/.vim/setup/install_cppcheck.sh
~/.vim/setup/install_ccls.sh

# Bazel
~/.vim/setup/install_bazel.sh
~/.vim/setup/install_buildifier.sh

# Json
pip3 install demjson
sudo npm install --global prettier

# Markdown
# npm install --global prettier

# cmake
pip3 install cmake_format cmakelint

# Dockerfile
~/.vim/setup/install_hadolint.sh

# VimScript
pip3 install vim-vint

# tldr
sudo npm install --global tldr

# dircolors
curl https://raw.githubusercontent.com/seebi/dircolors-solarized/master/dircolors.ansi-dark \
    -o ~/.dircolors
