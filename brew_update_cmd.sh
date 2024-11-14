#!/bin/bash
brew -v update; brew -v upgrade; brew upgrade --cask; brew cleanup; brew doctor; brew cleanup --prune=all 
