#!/usr/bin/env bash

# INSTALL PLUGINS
# Plugins installed into this directory will be autoloaded upon vim startup
cd ./vim/pack/vendor/start

# vim-slime - send code from vim to terminal
rm -rf vim-slime
git clone https://github.com/jpalardy/vim-slime.git

# NERDTree - file tree browser
rm -rf nerdtree
git clone --depth 1 https://github.com/preservim/nerdtree.git
