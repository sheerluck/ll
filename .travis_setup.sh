#!/bin/bash

echo "Starting asdf build"
if [ ! -f "$HOME/.asdf/asdf.sh" ]; then
    echo "Cloning asdf"
    sudo apt-get update -ymq
    git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.5.1
fi

echo "Activating asdf"
echo -e '\n. $HOME/.asdf/asdf.sh' >> $HOME/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> $HOME/.bashrc

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash

if [ ! -f "$HOME/.asdf/plugins/nim/bin/install" ]; then
    echo "Installing asdf nim plugin"
    asdf plugin-add nim https://github.com/rfrancis/asdf-nim
fi

if [ ! -f "$HOME/.asdf/installs/nim/v0.20.0/bin/nim" ]; then
    echo "Installing nim v0.20.0 via asdf"
    asdf install nim v0.20.0
fi

echo "Setting nim v0.20.0 as global"
asdf global nim v0.20.0
