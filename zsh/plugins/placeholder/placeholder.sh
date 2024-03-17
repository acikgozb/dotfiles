#!/usr/bin/env bash

prest() {
    cp "$XDG_CONFIG_HOME/placeholders/rest.placeholder" $1
}

"$@"
