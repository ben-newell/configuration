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
brew install --cask github
brew install --cask hyper
brew install --cask visual-studio-code

# Communication Apps
echo "Installing communication apps..."
brew install --cask discord
brew install --cask keybase
brew install --cask microsoft-teams
# brew install --cask protonmail-bridge
brew install --cask slack

# Web Tools
echo "Installing web tools..."
brew install httpie
brew install node
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask firefox

# File Storage
echo "Installing file storage tools..."
brew install --cask google-drive

# Writing apps
echo "Installing writing apps..."
brew install --cask prowritingaid

# Other
echo "Installing everything else..."
brew install --cask 1password
brew install --cask alfred
brew install --cask rectangle
brew install --cask app-cleaner
brew install --cask cleanmymac
brew install --cask little-snitch
brew install --cask iterm2
brew install --cask notion
brew install --cask vlc
brew install --cask obs
brew install --cask istat-menus
<<<<<<< HEAD

=======
brew install --cask pdf-expert
brew install --cask google-assistant
brew install --cask gpg-suite
>>>>>>> 051bf615843d724946290ce16b6c3113080a8156
