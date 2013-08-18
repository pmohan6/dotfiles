# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /apollo/env/envImprovement/var/bashrc
# User specific aliases and functions


#Adding Eclipse bin to $PATH
export PATH=/apollo/env/eclipse-3.7/bin:$PATH
export PATH=$HOME/bin:$PATH
export EDITOR=vim
export P4EDITOR=vim

export P4PORT=perforce.amazon.com:9591
export P4CONFIG=.p4config

export TERM=xterm-256color

#alias scssh='/apollo/env/MidwayClient/bin/ssh -I /usr/lib/libeToken.so'
alias scssh='/apollo/env/MidwayClient/bin/ssh -I /usr/lib64/libeToken.so'
alias scssh-agent='/apollo/env/MidwayClient/bin/ssh-agent'
alias scssh-add='/apollo/env/MidwayClient/bin/ssh-add'
alias scpin='source ~/.ssh-agent-start'
alias screpin='killall ssh-agent; source ~/.ssh-agent-start'
alias bb='brazil-build'
alias bbl='brazil-build -logger org.apache.tools.ant.listener.AnsiColorLogger'
alias rbb='brazil-recursive-cmd brazil-build'
alias rbbl='brazil-recursive-cmd brazil-build -logger org.apache.tools.ant.listener.AnsiColorLogger'
alias epse='nohup eclipse & disown %1'
alias log='ssh swf-log-analysis-1001.vdc.amazon.com'
# envImprovement aliases and functions
ENABLE_VCS_INFO=1
BASH_THEME=vcs_info

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
