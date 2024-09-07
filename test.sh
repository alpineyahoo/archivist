#!/usr/bin/env zsh

export PATH="$PATH:$HOME/.local/pipx/bin:/usr/local/bin:/usr/bin:/bin" # depends on dirs where waybackpy and else are stored
bkmk="google.com"
# bkmk="foobarhogehoge.com"
entry=$(waybackpy -u "$bkmk" -n 2> /dev/null | grep http) && echo "entry exists: $entry" || echo "no entry found"
# $? is 0 if bkmk="google.com", 1 if bkmk="foobarhogehoge.com"
