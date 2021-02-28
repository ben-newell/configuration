#!/usr/bin/env bash

set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}
#
pretty_print "Here we go..."

# So it begins
# Homebrew installation

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

# Homebrew OSX libraries

pretty_print "Updating brew formulas"
  	brew update


pretty_print "Installing GNU core utilities..."
	brew install coreutils

pretty_print "Installing GNU find, locate, updatedb and xargs..."
	brew install findutils

printf 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
# brew install coreutils
# ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
# brew install moreutils
# Install GNU `sed`, overwriting the built-in `sed`.
# brew install gnu-sed --with-default-names
# Install a modern version of Bash.
# brew install bash
# brew install bash-completion2

# Install `wget` with IRI support.
# brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
# brew install gnupg

# Install more recent versions of some macOS tools.
# brew install vim --with-override-system-vi
# brew install grep
# brew install openssh
# brew install screen
# brew install php
# brew install gmp

# Install font tools.
# brew tap bramstein/webfonttools
# brew install sfnt2woff
# brew install sfnt2woff-zopfli
# brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

# Install other useful binaries.
# brew install ack
# #brew install exiv2
# brew install git
# brew install git-lfs
# brew install gs
# # brew install imagemagick --with-webp
# brew install lua
# brew install lynx
# brew install p7zip
# brew install pigz
# brew install pv
# brew install rlwrap
# brew install ssh-copy-id
# brew install tree
# brew install vbindiff
# brew install zopfli

# Remove outdated versions from the cellar.
brew cleanup

# Install outdated tools.

# brew install gnu-sed --with-default-names
# brew install gnu-tar --with-default-names
# brew install gnu-indent --with-default-names
# brew install gnu-which --with-default-names
# brew install gnu-grep --with-default-names

# Install Bash 4
# brew install bash

PACKAGES=(
    markdown
    npm
    node
    go
    dnstop
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew tap homebrew/cask

CASKS=(
    divvy
    hyper
    spotify
    alfred
    app-cleaner
    little-snitch
    cleanmymac
    hex-fiend    
    shortcat
    the-unarchiver
    1password
)

echo "Installing cask apps..."

brew install ${CASKS[@]} --cask

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    ipython
    virtualenv
    virtualenvwrapper
)
sudo pip3 install ${PYTHON_PACKAGES[@]}

echo "Downloading tools from newosxbook... objectivesee..."

cd; cd Downloads/;
mkdir tools; cd tools/;
_URL=(
  2020/08/ulbow14.zip
  2020/07/mints1b05.zip
  2020/07/spundle13.zip
  2019/08/pratique11.zip
  2019/08/sandstrip11.zip
  2020/07/archichect24.zip
  2020/08/t2m2115.zip
  2020/08/consolation310.zip
  2020/08/podofyllin10.zip
  2020/08/alifix12.zip
  2020/08/delighted2.zip
  2020/08/taccy111.zip
  2019/09/signpostkit2.zip
  2019/09/routemap10b3.zip
  2019/08/keychaincheck21.zip
  2020/08/dystextia17.zip
  2020/08/permscan18.zip
  2019/09/rosettavert14.zip
  2020/08/apfelstrudel14.zip
  2019/06/unorml3.zip
  2019/06/blowhole9.zip
)

for temp in ${_URL[@]}; do
    wget_output=$(wget --execute="robots = off" --convert-links --no-parent --wait=5 --limit-rate=90k https://bitbucket.org/objective-see/deploy/downloads/$temp)
    if [ $? -ne 0]; then
        break;
    fi
done

temp_URL=(
    ProcessMonitor_1.3.0.zip
    FileMonitor_1.2.0.zip
    LuLu_1.2.3.zip
    TaskExplorer_2.0.2.zip
    BlockBlock_1.0.2.zip
    OverSight_1.2.0.zip
    Netiquette_1.1.1.zip
    DHS_1.4.1.zip
    )

for URL in ${temp_URL[@]}; do
    wget_output=$(wget --execute="robots = off" --convert-links --no-parent --wait=5 --limit-rate=90k https://bitbucket.org/objective-see/deploy/downloads/$URL)
    if [ $? -ne 0]; then
        break;
    fi
done

temp_=(
    procexp.tgz
    kdv.tar
    lutil.tgz
    supraudit.tgz
    XPoCe2.75.tgz
    jtool2.tgz
)

for link in ${temp_[@]}; do
    wget_output=$(wget --execute="robots = off" --convert-links --no-parent --wait=5 --limit-rate=90k http://newosxbook.com/tools/$link)
    if [ $? -ne 0]; then
        break;
    fi
done

app=(
    filemon.tgz
    hfsleuth.tar
    lsock
)

for i in ${app[@]}; do
    wget_output=$(wget --execute="robots = off" --convert-links --no-parent --wait=5 --limit-rate=90k http://newosxbook.com/files/$i)
    if [ $? -ne 0]; then
        break;
    fi
done
