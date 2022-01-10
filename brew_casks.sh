#!/bin/sh
echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing brew cask..."
brew tap homebrew/cask

# Programming Languages
echo "Installing programming languages..."
brew install --cask python3


# Dev Tools
echo "Installing development tools..."
brew install docker 
brew install git
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

