#!/usr/bin/env zsh

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
avail(){
	url=$(echo "$@" | cut -d, -f2)
	curl -sL "https://archive.org/wayback/available?url=$url" |
	jq -r '.archived_snapshots.closest.available // "null"' |
	paste -d ',' - <(echo "$@");
}

avail "418,https://qiita.com"
# echo Hello | paste -d ',' - <(echo World) # Hello,World
