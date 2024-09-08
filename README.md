# Archivist
[Raindrop.io](https://raindrop.io)からエクスポートしたブックマークリストから[archive.org](https://archive.org)上にアーカイブエントリーを作成するスクリプト

# Prereq
You need [waybackpy](https://github.com/akamhy/waybackpy) CLI. I implemented this script with waybackpy cli, not the waybackpy package to import.

# Installation
```sh
foobar
```

# Subcommands
```sh
archivist init: run first.
          start 90min: start the process from the raw csv with 1.5h timer. only minutes available to set.
          restart 31min: restart from the csv bits interrupted by timer before          
```

You cannot start/restart without timer. Timer would be ignored if the process gets done earlier.
# Env Vars
- `ARCHIVIST_DEFAULT_PATH`: default raindrop.io exported csv files location which archivist suggests you first. must be defined.
- `ARCHIVIST_SELECT_LATEST`: always select latest csv file in `$ARCHIVIST_DEFAULT_PATH` when `archivist start` is evoked. doesn't ask you to select.
- `ARCHIVIST_WIP_PATH`: default location where csv files being manipulated or paused by archivist are stored. must be defined.
- `ARCHIVIST_IGNORE_URL`: URLs archivist ignores. must include __web.archive.org/*__. the delimiter must be a comma.

Example:
```sh:~/.config/archivist/config
export ARCHIVIST_DEFAULT_PATH="$HOME/backups/raindrop.io/"
export ARCHIVIST_SELECT_LATEST=1
export ARCHIVIST_WIP_PATH="$HOME/.cache/archivist"
export ARCHIVIST_IGNORE_URL='google.com/search?q=*,foobar.com/tmp,web.archive.org/*'
```
