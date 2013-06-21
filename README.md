# Dotfiles

My dotfile setup for new *nix machines, including

- zsh
- oh-my-zsh
- vim
- janus
- tmux
- slate (OS X)

### 1. Install cli tools

This varies per OS, so I will let you decide what packaging system you
want to use. In any case, you will need

- git
- curl
- wget
- rake
- zsh
- vim
- tmux

### 2. Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

### 3. Install [janus](https://github.com/carlhuda/janus)

    curl -Lo- https://bit.ly/janus-bootstrap | bash 

### 4. Clone repo

    git clone https://github.com/mvanasse/dotfiles ~/dotfiles
    cd ~/dotfiles
    chmod +x makesymlinks.sh
    ./makesymlinks.sh
