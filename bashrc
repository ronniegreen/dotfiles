# BOILERPLATE
  # If not running interactively, don't do anything
  [ -z "$PS1" ] && return

  # don't put duplicate lines or lines starting with space in the history.
  # See bash(1) for more options
  HISTCONTROL=ignoreboth

  # append to the history file, don't overwrite it
  shopt -s histappend

  # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
  HISTSIZE=1000
  HISTFILESIZE=2000

  # check the window size after each command and, if necessary,
  # update the values of LINES and COLUMNS.
  shopt -s checkwinsize

# ALIASES
  alias ll='ls -alF'
  alias la='ls -A'
  alias l='ls -CF'
	alias er="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
  alias e='ls -la'
  alias d='cd ..'
  alias f='cd -'

  # TMUX
  alias tm='tmux'
  alias tma='tmux attach'
  alias tmas='tmux attach-session'
  alias tmat='tmux attach -t'
  alias tml='tmux list-sessions'
  alias tmn='tmux new-session -s'
  alias tmr='tmux rename-session'
  alias tmk='tmux kill-session -t'

  # EDIT BASHRC
  alias eb='cd && vim .bashrc'
  # SOURCE BASHRC
  alias sb='source ~/.bashrc && echo "Sourced .bashrc"'

  # WENDY'S
    export catalina='/Library/Tomcat/bin/catalina.sh'
    export b='/Library/Tomcat/webapps/ROOT/'
    export r='/Users/mvanasse/Documents/Dev/wendy/www.claimyourtaste.com/trunk/src/ClaimYourTaste/'
    export w='/Users/mvanasse/Documents/Dev/wendy/www.claimyourtaste.com/trunk/src/ClaimYourTaste/src/main/webapp/'
    export t='/usr/local/apache-tomcat-7.0.32/webapps/ROOT/'

    # DIRECTORIES
    alias wnd-dir-build='cd ${b} && ls -la'
    alias wnd-dir-webapp='cd ${w} && ls -la'
    alias wnd-dir-tomcat='cd ${t} && ls -la'
    # FILES
    alias wnd-vim-index='cd ${b} && vim index.jade'
    alias wnd-vim-style='cd ${t}assets/css/ && vim style.styl'
    alias wnd-vim-app='cd ${t}assets/js/ && vim app.js'
    alias wnd-log='vim /usr/local/apache-tomcat-7.0.32/logs/ClaimYourTasteLog.log'
    # COMMANDS
    alias wnd-copy='cp ${b}index.jade ${w}index.jade && cp ${b}index.html ${w}index.html && cp ${t}assets/css/style.styl ${w}assets/css/style.styl && cp -R ${t}assets/css/ ${w}assets/css/ && cp -R ${t}assets/js/ ${w}assets/js/ && cp -R ${b}assets/img/ ${w}/assets/img/'
    alias wnd-build='cd ${r} && sudo mvn clean package && sudo rm -rf ${t}* && cp -R ${r}/target/ClaimYourTaste-1.0-SNAPSHOT/* ${b} && sudo ${catalina} stop && sudo ${catalina} start && wnd-dir-build'
    # Read below for explanation of the above
    # cd /Users/mvanasse/Documents/Dev/wendy/www.claimyourtaste.com/trunk/src/ClaimYourTaste
    #   move to the directory containing pom.xml
    # sudo mvn clean package
    #   self explanatory
    # sudo rm -rf /Library/Tomcat/webapps/ROOT/*
    #   ensure that ROOT dir is empty; we are about to fill it with the new build
    # cp -R /Users/mvanasse/Documents/Dev/wendy/www.claimyourtaste.com/trunk/src/ClaimYourTaste/target/ClaimYourTaste-1.0-SNAPSHOT/* /Library/Tomcat/webapps/ROOT
    #   copy files from build to Tomcat directory
    # sudo /Library/Tomcat/bin/catalina.sh stop
    #   stop Tomcat
    # sudo /Library/Tomcat/bin/catalina.sh start


# DISPLAY ACTIVE GIT BRANCH IN BASH PROMPT
PS1="\u@\h:\w\$(git branch 2>/dev/null | grep -e '\* ' | sed 's/^..\(.*\)/{\1}/') \$ "

# PROMPT
export PS1="  µ \[$(tput bold)$(tput setaf 4)\]\w \[$(tput sgr0)\]" 
# export PS1="  µ " 

# PATHS
# export PATH=$PATH:/home/mav/Dev/vert.x/bin
# export PATH=$PATH:/home/mav/Dev/node/geddy/bin
# export PATH=$PATH:/home/mav/Documents/doctorjs/bin
NODE_PATH='/usr/local/lib/jsctags:${NODE_PATH}'

# NODE VERSION MANAGER
# . ~/nvm/nvm.sh
# nvm use v0.6.20

# GOLANG

#This line will tell the Go installer where to place the source code before compilation
export GOROOT=$HOME/gosource
 
#With this line, you choose the architecture of your machine.  
#Those with 64 bit CPUs should enter "amd64" here.  
#export GOARCH=386
export GOARCH=amd64
 
#Your operating system
export GOOS=linux
 
#And now the location where the installer will place the finished files
#Don't forget to create this directory before installing
export GOBIN=$HOME/gobin
 
#Include Go binaries in command path
export PATH=$PATH:$GOBIN

# ENABLE COLOR SUPPORT OF LS AND ALSO ADD HANDY ALIASES
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# ALIAS DEFINITIONS
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ENABLE PROGRAMMABLE COMPLETION FEATURES
# You don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
