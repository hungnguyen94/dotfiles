if [[ -o login ]] ; then
  echo login shell
else
  echo _no_ login shell
fi

echo "Loading ${0:a}"
######################################
# Rerun last command with sudo
alias please='sudo $(fc -ln -1)'
# Set editor variable
export EDITOR=$(which vim)

# Keep 15000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=15000
SAVEHIST=15000
HISTFILE=~/.zsh_history

# Load rvm
#source ~/.rvm/scripts/rvm

# Autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select 

# History substring search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# Dircolors
eval `dircolors ~/.dircolors`
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

source ~/.zplug/init.zsh

# Git plugin from omz
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-extras", from:oh-my-zsh
# Quick access to files and dirs https://github.com/clvv/fasd
zplug "plugins/fasd", from:oh-my-zsh
# Common aliases
autoload -U is-at-least
zplug "plugins/common-aliases", from:oh-my-zsh
# Guess what to install when running an unknown command.
zplug "plugins/command-not-found", from:oh-my-zsh
# Fish-style autosuggestions
zplug "zsh-users/zsh-autosuggestions"
# Fish-style highlighting
zplug "zsh-users/zsh-syntax-highlighting", nice:19
# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"
# Bullet train theme
setopt prompt_subst # Make sure propt is able to be generated properly.
zplug "caiogondim/bullet-train-oh-my-zsh-theme", use:bullet-train.zsh-theme
# Search shell history with peco when pressing ctrl+r
zplug "jimeh/zsh-peco-history"


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Source plugins and add commands to $PATH
zplug load --verbose
