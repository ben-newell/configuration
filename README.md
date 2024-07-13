⚠️ Recommend against using any of these dotfiles before reading them!

# dotfiles

> **Note:** This configuration requires the use of Unix commands in Terminal.

Please [report](https://github.com/eBenNewell/configuration/issues) issues if you encounter any unclear instructions or errors.

This setup has been tested on macOS versions 10.13, 10.14, 10.15+.

Post Setup Wizard, I setup iCloud, and get everything from the app store.

Things like Mail.app, Contacts.app, Calendar.app, and *.app.

# SHELL

Ensure you change the shell before running bootstrap.sh.

Ensure you're signed into your App Store and iCloud accounts. Some processes in `./.macos` require you to be signed in. If any unexpected files are added to your HOME directory, remove them manually and consider making a pull request.

The default interactive shell in Mojave is bash, while in Catalina (10.15), it's zsh. [wikipedia](https://en.wikipedia.org/wiki/Z_shell)

- [Here](https://www.addictivetips.com/mac-os/hide-default-interactive-shell-is-now-zsh-in-terminal-on-macos/) [are](http://zsh.sourceforge.net/) [a](https://discussions.apple.com/thread/250911992) [few](https://www.howtogeek.com/362409/what-is-zsh-and-why-should-you-use-it-instead-of-bash/) [helpful](http://zsh.sourceforge.net/Doc/Release/index.html#:~:text=Zsh%20is%20able%20to%20emulate,last%20updated%20February%2014%2C%202020.) [links](https://github.com/koalaman/shellcheck/)

### From bash or zsh

Type `git` in the terminal. You should see prompts to install the command line tools. Follow the steps in the windows that appear.

![Imgur](https://i.imgur.com/hgheXKb.png)
![Imgur](https://i.imgur.com/hkn1u9d.png)

#### Cloning the repo:

```bash
git clone https://github.com/ben-newell/configuration.git && cd configuration
```

Run `bootstrap.sh` to move things to ~, this will also check the remote repo.

`source bootsrap.sh`

- Use `cd` to move to `~/HOME`
- Run `chmod +x installer && chmod +x ./installer.sh`
- Exit the interactive shell.

#### With Curl

```bash
cd; curl -L https://github.com/eBenNewell/configuration/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE.txt}
```

### Update

I regularly sync files when source is updated as I have mutliple machines using this config.

```bash
source bootstrap.sh
```

### Avoid the confirmation prompt.

```bash
set -- -f; source bootstrap.sh
```

[(Or, for forking and synchronizing this repository)](https://docs.github.com/en/github/collaborating-with-issues-and-pull-requests/syncing-a-fork)

# Installers

During the execution of installers, particularly PACKAGES, you'll be prompted to enter your password. When prompted, I usually select "Always allow".

![imgur](https://i.imgur.com/HicnyjD.png)

```bash
cd; ./installer.sh
```

```bash
./tmux.sh
```

Note: I like to install a few apps from the App Store after this. This simplifies things when wiping and re-imaging a computer. For instance:

- CopyClip: Upon opening, I also do things like tick the box to start the app during login.
- Magnet: Upon opening, it'll request permission to control the computer which I always grant. After granting it, tick the box to open at login for this one as well.

# Dotfiles Notes: Personal Reference for Future Use

## Steps / To-Do

1. Launch zsh using: `zsh`

2. If running Mojave or earlier chsh -s $(which zsh) "The default interactive shell is now zsh (as of 10.14.x as mentioned earlier) To update your account to use zsh, I run `chsh -s /bin/zsh`. For more details, please visit [Use zsh as the default shell on your Mac](https://support.apple.com/kb/HT208050). I'll use `echo $SHELL` when it is not clear what shell is being used.

3. Keep your files in a seperate directory and copy or link them. Follow the example in [mdo/config](https://github.com/mdo/config/blob/master/config.sh). Mark sets up his home directory on any system that he uses with a $HOME/github_dir and a $HOME/work_dir. The github_dir could be used storing dotfiles since the VCS used here is git. I enjoy this method and will sym link or copy the files to the 🏠 folder.

4. Install XCode from the App store and run `xcode-select --install` as well as `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer` and `sudo xcodebuild -runFirstLaunch` to install command line tools. This is likely already done by this point but I like to double check these as this is a big download. This will take a while without a fiber connection ⚡️

# Strap

## 1. [bootstrap.sh](http://bootstrap.sh/) (Bootstrap Installs Things)

This step is important for the bootstrap loader. Jump into the git directory and start rsync’ing the files to your home directory. Then, source the `zshenv` file. Usually keep zsh setup so that I can load `fish` only if I want to.

Error handling and garbage collection are included. If forced, do not call prompt. Because this script is called immediately after cloning the repository, you will need it to "hop" into the directory "after" cloning. Curl: the "cd;" command alone always puts you in your home directory, and the bootstrap script will handle copying the files to the home directory for you.

Manual inspection is required for the bootstrap loader. The following command is the first step in the script:

```bash
cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd;
```

The script then pulls the latest changes from the master branch:

```bash
git pull origin master;
```

The `sync()` function is crucial for error checking (see the "if" statement below) and rsync's the repository to your home directory. It sources from the current directory.

Error handling checks the shell:

````bash
if [ -n "$ZSH_VERSION" ]; then```

More error handling for forced updates:
`if [ "$1" == "--force" -o "$1" == "-f" ]; then`

The "sync" function is unset for garbage collection:
`unset sync;`

## 2. ./brew.sh

Some quick things about Homebrew that you might find useful.
- brew tap homebrew/cask-versions (Installs the [Cask-Versions](https://github.com/Homebrew/homebrew-cask-versions) package that lets you install alternative versions of cask packages.)


## 3. ./.macos

> Pass your values through defaults to set-up system preferences.

## 4. ./tmux.sh

Enter password when prompted. When finished: `tmux` and `exit` to ensure it is working.

With [.tmux](https://github.com/gpakosz/.tmux#:~:text=tmux%20%3E=%202.1%20(soon%20%3E=%202.4)%20running%20inside%20Linux,%20Mac,%20OpenBSD,%20Cygwin%20or%20WSL) you will need an older version and this can be tricky but the scirpt should take care of that.

## 5. .tmux/

[.tmux](https://github.com/gpakosz/.tmux) - a few adjustments can be made after installation. You can also adjust the instrcutions listed below to install the git repository in your dotfiles folder and link or copy the conf files from there instead of directly in your home directory. If your home directory is a git repository anyway, I am sure you know that anything not listed to igrnore during a `git clean` will be removed. Then `tmux` and `exit` to ensure it is working.

```bash
$ cd
$ git clone https://github.com/gpakosz/.tmux.git
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
````

## 6. [oh-my-zsh](https://ohmyz.sh/)

[Prerequisites](<https://github.com/ohmyzsh/ohmyzsh#:~:text=Prerequisites%0A%0A%20%20%20%20A%20Unix-like%20operating%20system:%20macOS,%20Linux,%20BSD.%20On%20Windows:%20WSL2%20is%20preferred,%20but%20cygwin%20or%20msys%20also%20mostly%20work.%0A%20%20%20%20Zsh%20should%20be%20installed%20(v4.3.9%20or%20more%20recent%20is%20fine%20but%20we%20prefer%205.0.8%20and%20newer).%20If%20not%20pre-installed%20(run%20zsh%20--version%20to%20confirm),%20check%20the%20following%20wiki%20instructions%20here:%20Installing%20ZSH%0A%20%20%20%20curl%20or%20wget%20should%20be%20installed%0A%20%20%20%20git%20should%20be%20installed%20(recommended%20v2.4.11%20or%20higher)>)

Following the install you'll see the pre/post changes as ".zshrc-pre-oh-my-zsh" and ".zshrc" you will need to copy the config from pre to post. Just make sure the aliases come after the path variables command as mentioned. You might like these changes though. Consider the contents before copy pasting and look out for pre-zsh, bash commmands that might still be around.

#### via curl

```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### via wget

```shell
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

#### via fetch

```shell
sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 7. [gpakosz/.vim](https://github.com/gpakosz/.vim)

#### If you want to install the configuration

```bash
$ cd
$ rm -rf .vim
$ git clone https://github.com/gpakosz/.vim.git
$ ln -s .vim/.vimrc
```

#### Heavenly branch (_grin_)

```bash
$ cd .vim
$ git checkout heavenly
$ git submodule init && git submodule update
```

### dot files & rc (resource files for runtime)

| Locaiton                   | Descritpion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| -------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------- |
| `~./dotfiles`              | Installation With your dotfiles in their own repository, there are two possible ways to install dotfiles on systems: copying or symbolically linking files. Symbolic links are better — using symlinks, there is no need to manage discrepancies between copies. Changes to configuration files are changes to the working copy in the repository.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `brew`                     | This is taken care of inside of the installation script (so far) and looks like : `mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | tar xz --strip 1 -C homebrew` always. Thanks to Marks error handling. |
| `.gitconfig`               | [Creating your global gitconfig file](https://digitalfortress.tech/tutorial/create-global-gitconfig-git-alias/) & [Global gitconfig base file](https://github.com/niketpathak/devpreferences/blob/master/git/.gitconfig)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| `.bash_profile or .zshenv` | [Migrate the right way](https://carlosroso.com/the-right-way-to-migrate-your-bash-profile-to-zsh/) if you are going to do a wipe and fresh install say from Mojave to Catalina, 10.14.x to 10.15.x.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `.zshrc`                   |
| `.zshenv`                  | First file to be evaluated                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `oh my zsh`                | [Repository](https://github.com/ohmyzsh/ohmyzsh) and help with installing @ [medium post](https://medium.com/@shivam1/make-your-terminal-beautiful-and-fast-with-zsh-shell-and-powerlevel10k-6484461c6efb)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `.vim`                     | Custom .vim thanks to [gpakosz](https://github.com/gpakosz/.vim.git) Links a .vimrc to your home ~/$(HOME), so clone anywhere, I would mkdir a ~/project folder or something similar to that. Use the git submodule init && git submodule update. From: https://www.vogella.com/tutorials/GitSubmodules/article.html Use the git submodule update command to set the submodules to the commit specified by the main repository. This means that if you pull in new changes in to the submodules, you need to create a new commit in your main repository in order to track the updates of the nested submodules." Exerpt from git documentation: "Submodules allow you to keep a Git repository as a subdirectory of another Git repository. This lets you clone another repository into your project and keep your commits seperate. Link: https://git-scm.com/book/en/v2/Git-Tools-Submodules |
| `install tmux 2.x`         | eBenNewell/configuration/tmux.sh thanks to someone, I can't remember but I found this in an old tmux issue thread on github and it has been so long, can't find it anymore. I have it kept seperate from the inital install_script(s).sh for now. Until I find the source or just give up and merge it with eBenNewell/config/install_script.sh and leave a little note at the top.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| `.tmux_conf`               | [Install](https://github.com/gpakosz/.tmux) and do something like mkdir ~/tmuxbuild && cd ~/tmuxbuil. If you have made a mistake and already have tmux > 3.x then try to install with a little help and https://medium.com/@wpcarro/brewing-an-old-batch-of-tmux-81c0a62715f9 `brew install https://raw.githubusercontent.com/Homebrew/homebrew-core/207dad3f513901d6457ffd3c80bf075006789359/Formula/tmux.rb` some code in your shell like this to see if the hash for 2.1 will work for downloaded tmux@2.1 or https://stackoverflow.com/questions/3987683/homebrew-install-specific-version-of-formula look here for notes on simple switching in homebrew. This article has proven to be invaluable. And if this creates more problems, try: https://gist.github.com/shrayasr/8714601                                                                                                       |
| `.zlogin`                  |
| `.zlogout`                 |
| `.zprofile`                |

# Troubleshooting

To scroll-back in tmux you need to prefix (Ctrl + A and [) to enter scroll mode then you can use your normal arrow keys.

Somewhere in here I've broken an alias. To be clear there are a few ls, ll, and la aliases -> I need to clean those up.

Still not getting spotlight to work properly in Catalina, or Mojave, however, in Mojave the spotlight menu bar shortcut is gone which is not the case in Catalina. Have the same menu bar shortcut issue with notification center can't remove it in Catalina but can in Mojave.

Need to set screen save setting to "Never".

Is spotlight reindexed after installation of new apps?

Automatically set display to "More room"?

Brew casks not installing?

Still getting the wrong scroll speed after a reboot.

toggle mouse keys? The float feature to move into the terminal automatically is nice, but not neccesary when using only a key board.

For installer isnt getting wget. Working on that now.

After rebooting and checking the install of oh-my-zsh or anything of the sort and then you get the "insecure" $PATH warning try logging out of zsh again and opening a new window or new tab from the loggout window.

- If not going away at login or startup of new interactive shell then try this to see if you need to change the permissions in the path: compaudit | xargs chmod g-w,o-w

It's likely you are not able to find a certain command! Here are a few things you can check... modify the PATH variable in ~/.zshenv then open a new window or tab. Conflict between files are a common problem when cloning a repository full of dotfiles (not to mention switching to zsh from bash and using ./oh-my-zsh... oh my!), for example shopt no longer exists in zsh, with the enrichment that it is agreed that zsh brings to the \*nix environemnt, one might not think that to be the case. When you are defining the aliases in your $HOME.zshrc, first, check whether your aliases are defined after your sourcing oh-my-zsh.sh. If you are using a custom file like .aliases, make sure that it's set as the $ZSH_CUSTOM variable in $HOME/.zshrc. Or source the file after the source oh-my-zsh.sh line.

You can remain on the ancient Bash 3.5.2 that dates back to 2007 if you wish, as Apple is not removing it from Catalina.

> An _interactive shell_

**Start Up** files are highly tailorable in bash/zsh.

For exmaple:

Cron shell scripts are always non-login and non-interactive.
SSH shells are always login and interactive.
Subshells are always interactive but not login.
Shell scripts are always non-login and non-interactive .
Initial TTY shell should be login and interactive.

# Bash

Since .bashrc is read on interactive but not login, and .bash_profile is read on all login shelss.

```
#!/usr/bin/env zsh
if [[ -o login ]]; then
        print yes
    else
        print no
    fi
```

As /etc/zshenv is run for all instances of zsh, it is important that it be kept as small as possible. In particular, it is a good idea to put code that does not need to be run for every single shell begind a test of the form 'if [[-o rcs]]; then ...' so that it will not be executed when zsh is invoked with the '-f' option.

## Many Thanks And Appreciation

- [Mark Otto](https://github.com/mdo/config)
- [Mathias’s dotfiles](https://github.com/mathiasbynens/dotfiles)
- [George Hotz](https://github.com/geohot/configuration)
- [MikeMcQuaid/strap](https://github.com/MikeMcQuaid/strap)
- [cowboy/dotfiles](https://github.com/cowboy/dotfiles)
- [gf3/dotfiles](https://github.com/gf3/dotfiles)
- [matijs/dotfiles](https://github.com/matijs/dotfiles)
- [Kevin Suttles awesome defaults project](https://github.com/kevinSuttle/macOS-Defaults)
- [Gregory Pakosz @gpakosz](https://github.com/gpakosz)

* vim @ [gpakosz/.vim](https://github.com/gpakosz/.vim)
* tmux @ [gpakosz/.tmux](https://github.com/gpakosz/.tmux)

- [oh my zsh](https://github.com/ohmyzsh/ohmyzsh)
- [niketpathak/devpreferences](https://github.com/niketpathak/devpreferences/blob/master/git/.gitconfig)
- [nikitavoloboev](https://github.com/nikitavoloboev/dotfiles)
- [Nate](https://natelandau.com/my-mac-osx-bash_profile/)
- [holman](https://github.com/holman/dotfiles?tab=readme-ov-file)
- [christoomey](https://github.com/christoomey/dotfiles?tab=readme-ov-file)

## Resources

- [The Unofficial Guide](https://dotfiles.github.io/bootstrap/)
- [Startup/Shutdown](http://zsh.sourceforge.net/Doc/Release/Files.html)
- [The config files of random github users, _not_ specific at all](https://github.com/search?q=zsh+dotfiles&ref=commandbar)

## Some additional system preferences I have not automated.

- Firefox new tab to Blank Page.
- Firefox new window to Blank Page.

- Drag and drop the home folder so that it sits in the dock permanently next to the downloads folder. Do this for the applications folder. Change "View content as" so that it is "list" and "Display as" so that it is "Folder" for both.

![dock](https://i.imgur.com/Hz8ydQj.png)

- Open Finder -> Finder Preferences -> Sidebar -> Check ~/HOME, your computers _name_ boxes.

![home](https://i.imgur.com/I7zRPvY.png)

![location](https://i.imgur.com/Upf6AiS.png)

- Untick: Recents, Documents, iCloud Drive, Recent Tags.

- [Chrome web store ublock origin](https://chrome.google.com/webstore/detail/ublock-origin/cjpalhdlnbpafiamejdnhcphjbkeiagm?hl=en) to disable the "people also search for feature". That feature in your chrome results is designed "push more users into searches which yield more sponsored results". [Follow these instructions - chrome only](https://webapps.stackexchange.com/questions/115038/how-to-stop-googles-people-also-search-for#answer-115197:~:text=www.google.co.uk%23%23%20.mw%20div%5Bjsl%5E%3D%22%24t%22%5D%5Bjsl%24%3D%220%3B%22%5D%5Bclass%5E%3D%22r%2D%22%5D,www.google.co.uk%23%23.ads%2Dad)

For adding commands to your terminal emulator of choice (hyper.js, terminal.app et. al.) use: export PATH="$PATH:`pwd`/<cmd>/bin"
Or use commands that set your PATH variable for interactive terminal window only. To permanently add commands to your path: https://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh

# One-offs

Turn off SWAP page-in's

Choosy - app that opens links the correct browser, rather this app gives you the choice.

Bookmarks - These get synced when I sign in. I used to save the html files. Except Brave.

For wallpapers, if im not having a rotating wallpaper everyminute (using the wallpapers that come with macOS) then I use custom jpgs of [alternative](https://alternativemovieposters.com/) movie posters created by using commands from imagemagick (can be installed with brew). Use preview to crop as needed.

- Sample:
  "convert -append 1.jpg 2.jpg out.jpg" - top to bottom
  "convert +append 1.jpg 2.jpg out.jpg" - left to right

- Special tips that might not apply to anything you want/need.

Remap the "Caps Lock" to escape key

uBlock Origin in Chrome needs could use these rules if you're interested in using Twitter in the browser:

Besides this it's nice to use advanced mode with dynamic filtering but be [WARNED](https://github.com/gorhill/uBlock/wiki/Advanced-user-features)

twitter.com##.trends.Trends.module

twitter.com##[aria-label="Timeline: Trending now"]

twitter.com##[data-testid="DMDrawer"]

Here is a simple explanation of the last one from the [Release Notes](https://twitter.com/i/release_notes#october-13-2020-notes:~:text=DM%20Drawer%3A%20The%20DM%20drawer%20will%20now%20animate%20when%20you%20open%20and%20close%20it.)

### For an example as you can see "What's Happening" is not included.

[What's Happening](https://i.imgur.com/3A7D8lP.png)

[What's Happening no longer included](https://i.imgur.com/5G3lY8K.png)

### The easy way to block elements with uBlock Origin.

[uBlock](https://i.imgur.com/2fHdFSF.png)

Things to change to dark mode:

- System (OS) Appearance
- apps:

  - Atom Nightly
  - VS Studio
  - VS Code - Insiders
  - XCode
  - outlook
  - teams
  - chrome (dark reader)
  - firefox (dark reader)

zsh themes that are nice:

- pygmalion-virtualenv
- philips

Brave in Chrome:
keep chrome as default search engine but install chrome extension "Custom New Tab URL" and use it to open https://search.brave.com for, obviously, adding the option to use brave's new beta or chrome (as it's still accessible from the search bar). Ctrl + L on win10 to access the search bar, or cmd + L on macOS to access the search bar.

Caching your GitHub credentials in Git
Install using homebrew:
brew install git (obviously)
brew tap microsoft/git
brew install --cask git-credential-manager-core
Next time you clone a repo you will be prompted to sign in.

DNS:
Make sure you set your dns to the location of the AdGuard.

Add custom keyboard shortcut in Preferences - Keyboard - Shortcuts

- Look at Microsoft Excel and choose "cmd + shift + a" to AutoFit Selection and the row with selected text will be autofit.

color issues in iterm/zsh/exa : a breakdown [link](https://github.com/ogham/exa/issues/412)

Get extra icons for exa

https://github.com/ryanoasis/powerline-extra-symbols

https://www.nerdfonts.com/#features

https://the.exa.website/features/icons

more: https://github.com/b-ryan/powerline-shell

# TMUX copy mode broken for keyboard

fix: https://unix.stackexchange.com/questions/665657/tmux-copy-and-paste-not-working

Instructions for OBS - recording using microphone for input, sound from
headphones for output.

### First

- Install blackhole [Link](https://existential.audio/blackhole/?pk_campaign=github&pk_kwd=readme)
- Create multi-output device in AUDIO MIDI setup tool in macOS
- Aggregate Bose headphones and Blackhole 2ch in one multi-output device, then
  change the default output to the aggreegate device.

### Next

- For input in OBS, connect the microphone and usb audio box to the computer,
  then, select the audio USB device from the input list and use it as the input.
- You will have a quiet microphone, google how to make this louder, there are
  some important settings that you'll change to increase input volumne.
  For googling, try something like [this](https://letmegooglethat.com/?q=how+to+make+audiobox+microphone+louder)

In OBS settings:

- Video capture device is USB camera, or what is installed if not.
- Audio input capture will say Unknown Audio Device (and not AudioBox or
  BlackHole 2ch), if this is too difficult just create an "aggregate device" in AUDIO MIDI Setup.
  Mic is microphone (unknown audio device), and airpods are output, select "aggregate device" on desktop sound output.
- Audio output is going to say BlackHole 2ch
- Display capture is basic, easy like the camera settings.

Settings in OBS output --> recording menu

- Container: .mkv
- Video bitrate: 700, this seems to produce nice file sizes
- Keyframe interval: 250, not sure what this is
- Rescale output: it's likely your using 4k, rescale to 1080p
- Video Encoder: H.264 Hardware Encoder, prores is for professional work
- Audio Bitrate: 96, compromise on quality for file size
- Encoder settings: Profile = Baseline, unckeck use B-Frames

Note on tmux conf file:
setw -g mode-keys vi in my tmux conf file for the vi keybinding movement in copy mode

Git Gutter:

mkdir -p ~/.vim/pack/airblade/start
cd ~/.vim/pack/airblade/start
git clone https://github.com/airblade/vim-gitgutter.git
vim -u NONE -c "helptags vim-gitgutter/doc" -c q

# zshrc - plugins

[zsh-community](https://github.com/zsh-users)
[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

# Notes

Better Touch Tool - touch input and window management
Karabiner-Elements - is about deep keyboard customization
Bartender 4 - paid - is about the menu bar icons (they take up so much space when it gets to be so many
iStatMenus -
iTerm2 -
CheatSheet - for seeing application shortcuts by holding left cmd
CleanMyMacX - cleaning tool for convenience
Little Snitch -
CLI apps from objective-see -
Alfred 5 -
Logitech G Hub -
rcmd - for navigating between apps quickly
Display link - dock specific app for pushing 4k monitors to macbook air
1pass - obvious choice for pw manager

Notes on Obsidian plugins:

- pane relief
- obsidian tabs
- dictionary
- tag wrangler???

### Testing new zsh theme

[Link](https://github.com/romkatv/powerlevel10k)

`git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`

Set ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc.
To configure or re-configure the themes, run:
`p10k configure`
`fish_config` - current prompt is "Arrow"

Mac-cli, the ultimate tool for dev's to manage their Mac, installable via curl:
`sh -c "$(wget https://raw.githubusercontent.com/guarinogabriel/mac-cli/master/mac-cli/tools/install -O -)"`
[Link](https://github.com/guarinogabriel/Mac-CLI)
