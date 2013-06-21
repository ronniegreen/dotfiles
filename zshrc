
# {{{ CONFIG

# {{{ SETTINGS

ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=mav
ZSH_THEME="agnoster"

DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"

export UPDATE_ZSH_DAYS=13

# }}}
# {{{ MODULES


# }}}
# {{{ OPTIONS

setopt AUTO_CD
setopt AUTO_PUSHD

# }}}

# }}}
# {{{ PLUGINS

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew)
plugins=(git)
plugins=(git-extras)
plugins=(last-working-dir)
plugins=(npm)
plugins=(osx)

# }}}
# {{{ ALIASES


# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias e="ls -lA"
alias er="tree"
alias j=".. && e"
alias k="- && e"
alias inst="sudo apt-get update && sudo apt-get install"
alias serve="python -m SimpleHTTPServer"

# {{{ DOTFILES

alias ev="vim ~/.vimrc"
alias eva="vim ~/.vimrc.after"
alias evb="vim ~/.vimrc.before"
alias eb="vim ~/.bashrc"
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc && print 'Sourced .zshrc'"
alias et="vim ~/.tmux.conf"
alias es="vim ~/.slate"

# }}}
# {{{ TMUX

alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'
alias tm='tmux'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tml='tmux list-sessions'
alias tmn='tmux new-session -s'
alias tmk='tmux kill-session -t'

# }}}

# }}}
# {{{ PATH

# {{{ EXPORTS
# }}}
# {{{ PATHDIRS

pathdirs=(

  $HOME/bin
  $HOME/gobin
  $HOME/.rvm/bin

  /bin
  /sbin
  /opt/bin

  /usr/bin
  /usr/sbin
  /usr/local/bin
  /usr/local/heroku/bin
  /usr/local/Library/ENV/4.3
  /usr/local/opt/autoconf/bin

)

for dir in $pathdirs; do
  if [ -d $dir ]; then
    path+=$dir
  fi
done

# }}}

# }}}

if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

source $ZSH/oh-my-zsh.sh
