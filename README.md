# dotfiles

## Many Thanks And Appreciation 
* [Mark Otto](https://github.com/mdo/config)
* [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
* [George Hotz](https://github.com/geohot/configuration)
* [MikeMcQuaid/strap](https://github.com/MikeMcQuaid/strap)
* [cowboy/dotfiles](https://github.com/cowboy/dotfiles)
* [gf3/dotfiles](https://github.com/gf3/dotfiles)
* [matijs/dotfiles](https://github.com/matijs/dotfiles)
* [Kevin Suttles awesome defaults project](https://github.com/kevinSuttle/macOS-Defaults)
* [Gregory Pakosz @gpakosz](https://github.com/gpakosz)
- vim @ [gpakosz/.vim](https://github.com/gpakosz/.vim)
- tmux @ [gpakosz/.tmux](https://github.com/gpakosz/.tmux)
* [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)

## Resources

* [The Unofficial Guide](https://dotfiles.github.io/bootstrap/)

## Get the dotfiles 

#### With Git
```bash 
git clone https://github.com/eBenNewell/configuration.git && cd configuration && source bootstrap.sh
```
#### With Curl
```
cd; curl -#L https://github.com/eBenNewell/configuration/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE.txt}
```
### Update
```bash
source bootstrap.sh
```
# Dotfiles Checklist *Personal Settings*

## Steps

1. chsh -s $(which zsh) "The default interactive shell is now zsh (as of 10.14.x) To update your account to use zsh, please run `chsh -s /bin/zsh`. For more details, please visit [Use zsh as the default shell on your Mac](https://support.apple.com/kb/HT208050). Like to use `echo $SHELL` when it is not clear what shell is being used. 
2. Keep your files in a seperate directory and copy or link them into place. Like [mdo/config](https://github.com/mdo/config/blob/master/config.sh) the way Mark sets up his home directory on any system that he uses with a $HOME/github_dir and a $HOME/work_dir. The github_dir could be used storing dotfiles since the VCS used here is git. We will sym link or copy the files to our 🏠 folder.  
3. These tools are additional dependencies that need to be installed prior to setting up your dotfiles. We do this first so that we have the latest versions of all the tools available. However tmux needs an older version which we will finangle with a script and a little git or homebrew, whichever you prefer to use. After we install the latest version, install XCode from the App store and run `xcode-select --install` to install command line tools. This will take a while with a small circuit at your house (connection), make sure to agree to the license so we can proceed to the next step. 
4. Keep in mind what comes next can be done in any order.

# Steps

## 1. bootstrap.sh (source bootsrap.sh) 

This step is important: bootstrap_loader.sh

Jump into the git directory and start rsync’ing the files to your home directory. Then, source on the zshenv file. 

Error handling and garbage collection. 

If forced do not call prompt. 

Becuase this script gets called in the same command that clones the repository to the system you will need this to "hop" into the directory "after" cloning it. Curl: the "cd;" commanad by itself will always put you in your home directory and the bootstrap script will handle copying the files into the home directory for you because you are using the git command. [cd (command)](https://en.wikipedia.org/wiki/Cd_(command)).

Manual inspection: bootstrap.sh 

`cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd;`
This is command #0 when thinking of the script in the terms of the source command which runs everything here as it passes them as its arguements. 

`git pull origin master;`
This is arguement #1 and does not use the origin/main convention from git parlance to pull from a remote branch in case there is a cached local version that you want to avoid.

`function sync()`
This function sync() is great, allowing for error checking later (see "if" statement below) and rsync's the repository to your home ~ and sources from . (source) i.e. current directory. Source and destination ( . source ) ( ~ destination ) 

`if [ -n "$ZSH_VERSION" ]; then`
Error handling. Checking the shell.

`if [ "$1" == "--force" -o "$1" == "-f" ]; then`
More error handling - either way if you don't agree to the --force the git pull command which I am still not sure about the sync() function will be executed if you agree to the prompt.

`unset sync;`
The "sync" function variable is not kept. Use unset for garbage collection. 

## 2. ./install_script.sh

## 3. ./brew.sh

## 4. ./.macos


### Dotfiles
| Locaiton                   | Descritpion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ---                        | ---                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|                            |
| `brew`                     | This is taken care of inside of eBenNewell/install_script.sh and looks like with a little code around it `mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | tar xz --strip 1 -C homebrew` always. Thanks to Marks error handling.
| `.alias`                   | 
| `.gitconfig`               | [Creating your global gitconfig file](https://digitalfortress.tech/tutorial/create-global-gitconfig-git-alias/) & [Global gitconfig base file](https://github.com/niketpathak/devpreferences/blob/master/git/.gitconfig)
| `.bash_profile or .zshenv` | [Migrate the right way](https://carlosroso.com/the-right-way-to-migrate-your-bash-profile-to-zsh/) if you are going to do a wipe and fresh install say from Mojave to Catalina, 10.14.x to 10.15.x.
| `On zsh and bash`    |
| `.zshrc`                   |
| `.zshenv`                  |
| `oh my zsh`                | [Repository](https://github.com/ohmyzsh/ohmyzsh) and help with installing @ [medium post](https://medium.com/@shivam1/make-your-terminal-beautiful-and-fast-with-zsh-shell-and-powerlevel10k-6484461c6efb)
| `.vim`                     | Custom .vim thanks to [gpakosz](https://github.com/gpakosz/.vim.git) Links a .vimrc to your home ~/$(HOME), so clone anywhere, I would mkdir a ~/project folder or something similar to that. Use the git submodule init && git submodule update. From: https://www.vogella.com/tutorials/GitSubmodules/article.html Use the git submodule update command to set the submodules to the commit specified by the main repository. This means that if you pull in new changes in to the submodules, you need to create a new commit in your main repository in order to track the updates of the nested submodules." Exerpt from git documentation: "Submodules allow you to keep a Git repository as a subdirectory of another Git repository. This lets you clone another repository into your project and keep your commits seperate. Link: https://git-scm.com/book/en/v2/Git-Tools-Submodules
| `install tmux 2.x`         | eBenNewell/config/install_tmux.sh thanks to someone, I can't remember but I found this in an old tmux issue thread on github and it has been so long, can't find it anymore. I have it kept seperate from the inital install_script(s).sh for now. Until I find the source or just give up and merge it with eBenNewell/config/install_script.sh and leave a little note at the top.
| `.tmux_conf`               | [Install](https://github.com/gpakosz/.tmux) and do something like mkdir ~/tmuxbuild && cd ~/tmuxbuil. If you have made a mistake and already have tmux > 3.x then try to install with a little help and https://medium.com/@wpcarro/brewing-an-old-batch-of-tmux-81c0a62715f9 `brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/207dad3f513901d6457ffd3c80bf075006789359/Formula/tmux.rb` some code in your shell like this to see if the hash for 2.1 will work for downloaded tmux@2.1 or https://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula look here for notes on simple switching in homebrew. This article has proven to be invaluable. And if this creates more problems, try: https://gist.github.com/shrayasr/8714601
