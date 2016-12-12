#!/usr/bin/env bash

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".gitignore" \
		--exclude "macOS.sh" \
		--exclude "ubuntu.sh" \
		--exclude "README.md" \
		--exclude "OTHER" \
		--include "MACOS" \
		-avh --no-perms . ~;
  mv MACOS/.* ~;
  zsh;
	source ~/.zshrc;
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


# 鼠标滚轮方向 false 与windows一致 true 则是保持原始
defaults write -g com.apple.swipescrolldirection -bool false
