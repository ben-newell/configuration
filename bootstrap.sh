#!/usr/bin/env bash
echo "Loading";
cd "$(dirname "${BASH_SOURCE}")";
echo "";

git pull origin master;

function sync() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude ".osx" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.txt" \
		--exclude ".github/" \
		--exclude ".travis.yml" \
		--exclude "Brewfile" \
		--exclude "Rakefile" \
		--exclude "setup/" \
		--exclude "CHANGELOG.md" \
		--exclude ".github/" \
		--exclude "ruby.sh" \
		--exclude "tmux.sh" \
		-avh --no-perms . ~;
		  if [ -n "$ZSH_VERSION" ]; then
     source ~/.zshrc;
  elif [ -n "$BASH_VERSION" ]; then
     source ~/.bash_profile;
  else
     echo 'unknown shell'
  fi
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then 
	sync;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync;
	fi;
fi;

unset sync;                                                    

