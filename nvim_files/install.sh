#!/usr/bin/env bash

echo "Installing NeoVim"
cd ~ && echo "***In ~ directory."
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# if admin privileges:
#sudo mv nvim.appimage /
#sudo ln -s /nvim.appimage /usr/bin/nvim

# otherwise
mv nvim.appimage .nvim.appimage
cd bin && echo "***In ~/bin directory."
ln -s ~/.nvim.appimage nvim 
export PATH="$HOME/bin:$PATH"

echo "***Success."

# on talapas, load a newer gcc version before opening nvim
# (upon loading nvim, it will attempt to install plugins)
module load gcc/12.2.0
