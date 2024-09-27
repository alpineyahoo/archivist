#!/usr/bin/env zsh

export PATH="$PATH:/usr/local/bin:/usr/bin:/bin"

case $(gum choose "default setting" "customize env vars" --header "You prefer...") in
	"default setting") mkdir -p $HOME/.config/archivist; echo "~/.config/archivist directory was created." ;;
	"customize env vars") echo "Script did nothing and you'll be ready after setting env vars!!" ;;
	* ) echo "You just interrupted or unexpected error occurred." ;;
esac
