#!/bin/sh

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Dev Tools
echo "Installing development tools..."
brew install git
brew install tmux
brew install wget
brew install exa
brew install grip
brew install lnav
brew install lazygit
brew install sox # brown noise generator
brew install glow # markdown viewer
brew install jless # json viewer
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
