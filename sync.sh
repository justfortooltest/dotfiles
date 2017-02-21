#!/usr/bin/env bash

GREEN='\033[0;32m'
NC='\033[0m' # No Color

function doDarwinInit() {
  echo -e "${GREEN} mac init successful ${NC}"
  # 鼠标滚轮方向 false 与windows一致 true 则是保持原始
  defaults write -g com.apple.swipescrolldirection -bool false
}

function doSync() {
  echo -e "current operator ${GREEN} $1 ${NC}"
  echo -e "ignore from ${GREEN} $PWD/other/exclude-$1.list ${NC}"

  rsync --exclude-from="$PWD/other/exclude-$1.list" \
    -avh --no-perms . ~;
  ln -s $PWD/.bin/$1/* ~/.bin
}

function doIt() {
  # darwin or linux
  operator=`echo $(uname) | tr "A-Z" "a-z"`
  if [ $operator = "linux" ] ; then
    doSync $operator;
  else
    doSync $operator;
    doDarwinInit;
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
unset doSync;
unset doDarwinInit;
