#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Command execution time stamp shown in the history command output
# * 'yyyy-mm-dd'    # yyyy-mm-dd + time
# * '[yyyy-mm-dd]'  # [yyyy-mm-dd] + [time] with colors
HIST_STAMPS='[yyyy-mm-dd]'

# Preferred editor for local and remove sessions
if [[ -n $SSH_CONNECTION  ]]; then
  export EDITOR='vim'
else
  export EDITOR='neovim'
fi

# Make pretty-ish.
# [user@host WORKDIR]: user and host are in purple, "@" is in green, and WORKDIR is in cyan.
# ## Default on EndeavourOS:
# ## PS1="[\u@\h \W]\$ "
# export PS1="\e[1;35m[\u\e[0m\e[1;32m@\e[0m\e[1;35m\h\e[0m \e[1;36m\W\e[0m\e[1;35m]\e[0m\$ "
# ## The below prompt is the one that was closest to what I want, but the last two characters are made invisible when reaching
# ## the end of the tmux pane.
# export PS1="\[\e[1;35m\]\u\[\e[0m\]\[\e[1;32m\]@\[\e[0m\]\[\e[1;35m\]\h\[\e[0m\]\[\e[1;36m\]\w\[\e[0m\]\[\e[1;35m\]\[\e[0m\$ "
export PS1="\[\033[01;35m\]\u\[\033[00m\]@\[\033[01;35m\]\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Bold-green everything.
# export PS1="\e[1;32m[\u@\h \W] $ \e[0m"

# A small script that will automatically attach itself to a tmux session with default name "main".
[ -z "_TMUX_AUTOATTACH_BEHAVIOR" ] && _TMUX_AUTOATTACH_BEHAVIOR="detach"

function _tmux_autoattach_detach {
  [ -z "$TMUX" ] && tmux -2u new-session -As main
}

# If `tmux` is called alone, without any parameters, spin up default instance, specified above.
# Else, call with appropriate parameters.
tmux () {
  if [ -z "$1" ]; then
    _tmux_autoattach_detach
  else
    command tmux "$@"
  fi
}

case "_TMUX_AUTOATTACH_BEHAVIOR" in 
  "detach" | *)
    tmux # was _tmux_autoattach_detach
      ;;
esac

# Personal aliases
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -al --color=auto'
alias grep='grep --color=auto'
alias please="sudo !!"    # retry last command with sudo

export PATH="/home/daniel/.local/bin:$PATH"

# Set vi-mode for Readline (Bash) and specify which vi mode (command or insert) in the prompt
# Ideally, write this to something like ~/.inputrc and have bash re-read it via `bind -f ~/.inputrc`
set -o vi
bind -f ~/.inputrc


# Allow for direnv to load env vars appropriately
eval "$(direnv hook bash)"
