#!/bin/sh

set -e

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR-alt for the first time..."
    git clone https://github.com/ianks/yadr-alt.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "YADR is already installed"
fi
