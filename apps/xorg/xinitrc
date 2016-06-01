#!/usr/bin/env sh

source_xinitrc_local() {
    [ -f $HOME/.xinitrc.local ] && source $HOME/.xinitrc.local
}

setup_i3() {
    [ ! -f $HOME/.i3/config ] && touch $HOME/.i3/config

    cat $HOME/.i3/config.base $HOME/.i3config.local > $HOME/.i3/config
}

start_apps() {
    [ -x /usr/bin/touchegg ] && /usr/bin/touchegg &
}

source_xinitrc_local
setup_i3
start_apps
