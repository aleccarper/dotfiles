# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/alec/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
alias vi=nvim
alias vim=nvim
alias sidekiq="SIDEKIQ_CONCURRENCY=10 sidekiq -C config/sidekiq.yml"

. /opt/asdf-vm/asdf.sh

#. $HOME/.asdf/asdf.sh

#. $HOME/.asdf/completions/asdf.bash

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  ssh-agent > ~/.ssh-agent-thing
fi
if [[ "$SSH_AGENT_PID" == "" ]]; then
  eval "$(<~/.ssh-agent-thing)"
fi
alias elasticsearch='docker pull docker.elastic.co/elasticsearch/elasticsearch:5.5.0 && docker volume create esdata && docker run --rm -v esdata:/usr/share/elasticsearch/data -p 9200:9200 -e "http.host=0.0.0.0" -e "transport.host=127.0.0.1" -e "xpack.security.enabled=false" docker.elastic.co/elasticsearch/elasticsearch:5.5.0'
alias d=kitty +kitten diff
alias rt='bundle exec rspec'
alias nfrt='SKIP_FIXTURES=true rt'
alias et='mix test'
alias config='/usr/bin/git --git-dir=/home/alec/.cfg/ --work-tree=/home/alec'
alias prcon='heroku console -a read-only-production'

# Zsh Vim Mode
bindkey -v
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[red]%} [% NORMAL]%  %{$reset_color%}"
    RPROMPT="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}[%*]"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
# End Zsh Mode
