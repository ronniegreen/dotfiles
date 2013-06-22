# Dotfiles

My dotfile setup for new *nix machines, including

- zsh
- oh-my-zsh
- vim
- janus
- tmux
- slate (OS X)

### 1. Install cli tools

This varies per OS/distro, so I will let you decide what packaging system you
want to use (e.g. apt-get, homebrew) to install. Additionally, you may find that you'll need more packages than the ones
listed here.

- git
- curl
- wget
- rake
- make
- cmake
- zsh
- vim
- tmux

### 2. Install [janus](https://github.com/carlhuda/janus)

    curl -Lo- https://bit.ly/janus-bootstrap | bash 

### 3. Clone and initialize this repo

    git clone https://github.com/mvanasse/dotfiles ~/dotfiles
    cd ~/dotfiles
    chmod +x makesymlinks.sh
    ./makesymlinks.sh

### 4. Configure [vim autocompletion](https://github.com/Valloric/YouCompleteMe) (optional)

This is for if you want *legit* autocompletion for vim, not a mediocre plugin or a hacky solution. It can take a bit to set up, but it's definitely worth your time.

Simply follow the instructions at the [repo page](https://github.com/Valloric/YouCompleteMe), which should start something like this:

    cd ~/dotfiles/janus/YouCompleteMe
    ./install.sh --clang-completer

Last I checked, neither Ubuntu nor OS X ship vim at version 7.3.584 or greater, which is necessary to run YouCompleteMe. All you have to do is [build vim from source](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source). It's easy -- just more command punching.
