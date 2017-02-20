#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

function macInit() {
  echo -e "${GREEN} mac init successful ${NC}"
  # 鼠标滚轮方向 false 与windows一致 true 则是保持原始
  defaults write -g com.apple.swipescrolldirection -bool false
}

function doIt() {
  operator=$(uname)
  if [ $operator = "Linux" ] ; then
    echo -e "current operator ${GREEN} $operator ${NC}"
    rsync --exclude-from="$PWD/other/exclude-linux.list" \
      -avh --no-perms . ~;
  else
    # macos
    echo -e "current operator ${GREEN} $operator ${NC}"
    rsync --exclude-from="$PWD/other/exclude-mac.list" \
      -avh --no-perms . ~;
    macInit;
  fi
}


if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
