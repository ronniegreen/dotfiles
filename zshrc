
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

# XXX TEMP
alias kiji-schema=$KIJI_HOME/schema-shell/bin/kiji-schema-shell
# /XXX TEMP

# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias e="ls -lA"
alias er="tree"
alias j=".. && e"
alias k="- && e"
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

# XXX TEMP
export DEV_TEMP=$HOME/Dev/temp
export KIJI_HOME=$DEV_TEMP/kiji-bento-albacore
export KIJI_MR_HOME=$KIJI_HOME/bin
export EXPRESS_HOME=$KIJI_HOME/express
export BENTO_CLUSTER_HOME=$KIJI_HOME/cluster
export HADOOP_HOME=$KIJI_HOME/cluster/lib/hadoop-2.0.0-mr1-cdh4.1.2
export HADOOP_CONF_DIR=$HADOOP_HOME/conf
export HBASE_HOME=$KIJI_HOME/cluster/lib/hbase-0.92.1-cdh4.1.2
export HBASE_CONF_DIR=$HBASE_HOME/conf
# example
export KIJI_CLASSPATH=$KIJI_HOME/examples/phonebook/lib
# /XXX TEMP

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

  $KIJI_HOME
  $KIJI_MR_HOME
  $KIJI_CLASSPATH
  $EXPRESS_HOME
  $BENTO_CLUSTER_HOME
  $HADOOP_HOME
  $HADOOP_CONF_DIR
  $HBASE_HOME
  $HBASE_CONF_DIR

)

for dir in $pathdirs; do
  if [ -d $dir ]; then
    path+=$dir
  fi
done
# }}}

# }}}

source $ZSH/oh-my-zsh.sh
