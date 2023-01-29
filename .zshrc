#!/bin/zsh

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  # shellcheck disable=SC2015
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  #alias ls='ls --color=auto'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

for file in ~/.{bash_prompt,aliases,functions,path,dockerfunc,extra,exports}; do
  if [[ -r "$file" ]] && [[ -f "$file" ]]; then
    # shellcheck source=/dev/null
    source "$file"
  fi
done
unset file

export EDITOR='vim'
export MANPAGER="vim -M +MANPAGER - "
HISTTIMEFORMAT="%F %T "

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt PROMPT_SUBST

export PS1="%D{%H:%M:%S} %1~\$(parse_git_branch) %(?.√.?%?) "
export FUNCTIONS_CORE_TOOLS_TELEMETRY_OPTOUT=true
setopt HIST_IGNORE_DUPS
autoload -Uz compinit && compinit

# Python/PyEnv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Node/NPM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Ruby/Gems
source /usr/local/opt/chruby/share/chruby/chruby.sh
chruby ruby-3.2.0

# DirEnv
eval "$(direnv hook zsh)"

# Add Brew PATH
export PATH=/usr/local/bin:$PATH
