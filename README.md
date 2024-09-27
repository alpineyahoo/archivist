# Archivist
[Raindrop.io](https://raindrop.io)のブックマークリストから[archive.org](https://archive.org)上に必要に応じてアーカイブエントリーを作成するスクリプト

# Prereq
You need [waybackpy](https://github.com/akamhy/waybackpy) CLI. I implemented this script with waybackpy cli, not the waybackpy package to import.

# Installation
Check what the code in the script looks like before you install the script to check whether it suits your need and preference.
```sh
foobar
```

# Subcommands
```sh
archivist init: run first.
          start 90min: start the process with 1.5h timer. only minutes available to set. overwrites history.
          restart 31min: restart the process from the history. the starting point(page) may be inaccurate.
```

You cannot start/restart without timer. Timer would be ignored if the process gets done earlier.
# Env Vars
- `ARCHIVIST_CONFIG`: config file location. defaults to `~/.config/archivist/config`.
- `RAINDROP_TEST_TOKEN`: raindrop test token to allow archivist to have access to your raindrops. access to raindrop.io and get the value. must be defined.
- `ARCHIVIST_DATA_DIR`: defaults to `~/.local/share/archivist`.
- `ARCHIVIST_IGNORE_URL`: URLs archivist ignores. must include __web.archive.org/*__. the delimiter must be a comma.

`~/.config/archivist/config` example (default config location):
```sh
export RAINDROP_TEST_TOKEN="1234567foobar"
# export ARCHIVIST_DATA_DIR="$HOME/.local/share/archivist"
export ARCHIVIST_IGNORE_URL='google.com,foobar.com/tmp,web.archive.org'
```

# What you do manually
`ckecklist.txt` file is created under `$ARCHIVIST_DATA_DIR` dir after script execution. The URLs inside `checklist.txt` are what returned 4xx HTTP error codes. That means you need find alternative URLs for those from [web.archive.org](https://web.archive.org) manually.
