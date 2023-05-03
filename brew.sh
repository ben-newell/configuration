#!/bin/sh

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew cask..."
brew tap homebrew/cask

# Programming Languages
echo "Installing programming languages..."

# Dev Tools
echo "Installing development tools..."
brew install docker 
brew install git
brew install jupyterlab
brew install mariadb
brew install perl
brew install tmux
brew install wget
brew install exa
brew install grip
brew install rust
brew install gh
brew install lnav
brew install lazygit
brew install bettertouchtool
brew install sox # brown noise generator
brew install glow # markdown viewer
brew install --cask sloth
brew install datasette
brew install --cask platypus
brew install --cask burp-suite
brew install showkey
brew install jless # json viewer
brew install --cask github
brew install --cask hyper
brew install --cask visual-studio-code
brew install atuin
brew install bat

# File Storage
echo "Installing file storage tools..."
brew install --cask google-drive

# Other
echo "Installing everything else..."
brew install --cask 1password
brew install --cask iterm2
brew install --cask obs
