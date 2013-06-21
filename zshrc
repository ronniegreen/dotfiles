# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
DEFAULT_USER=mav

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

# ALIASES
alias e="ls -lA"
alias er="tree"
alias j=".. && e"
alias k="- && e"
alias ev="vim ~/.vimrc"
alias eb="vim ~/.bashrc"
alias ez="vim ~/.zshrc"
alias sz="source ~/.zshrc && print 'Sourced .zshrc'"
alias et="vim ~/.tmux.conf"
alias es="vim ~/.slate"

alias tm='tmux'
alias tma='tmux attach'
alias tmas='tmux attach-session'
alias tmat='tmux attach -t'
alias tml='tmux list-sessions'
alias tmn='tmux new-session -s'
alias tmr='tmux rename-session'
alias tmk='tmux kill-session -t'

DISABLE_AUTO_TITLE=true

# When you open a file with vim, tmux sets the window name to the name of the file
# vim() {                                                                                                                                                                                                                                                                                                                                                                    
#   tmux rename-window "$*"                                                                                                                                                                                                                                                                                                                                                  
#   command vim "$@"                                                                                                                                                                                                                                                                                                                                                         
#   exit                                                                                                                                                                                                                                                                                                                                                                     
# }

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew)
plugins=(git)
plugins=(git-extras)
plugins=(last-working-dir)
plugins=(npm)
plugins=(osx)


# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/mav/gobin:/opt/bin:

export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
# export PATH=${PATH}:/Development/android-sdk-macosx/platform-tools:/Development/android-sdk-macosx/tools

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$HOME/bin:$PATH

source $ZSH/oh-my-zsh.sh
