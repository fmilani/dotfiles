# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in zsh plugins
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

autoload -U compinit && compinit

# Key bindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[[7~' beginning-of-line # Home key
bindkey '^[[H' beginning-of-line  # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line # End key
bindkey '^[[F' end-of-line  # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line # [End] - Go to end of line
fi
bindkey '^[[3~' delete-char # Delete key

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color -la'
alias cp='cp -i' # Confirm before overwriting something
alias df='df -h' # Human-readable sizes
alias free='free -m' # Show sizes in MB
alias vim="nvim"
alias v="nvim"
alias cbsp="nvim ~/.config/bspwm/bspwmrc"
alias chk="nvim ~/.config/sxhkd/sxhkdrc"
alias cpb="nvim ~/.config/polybar/config"
alias cz="nvim ~/.zshrc"
alias cv="nvim ~/.config/nvim/init.lua"
alias ct="nvim ~/.config/tmux/tmux.conf"
alias cr="nvim ~/.config/rofi/config.rasi"
alias open="jaro"
alias cat="bat"
alias pn="pnpm"
alias gitcount="git shortlog -s -n --all --no-merges"
alias please='sudo $(fc -ln -1)'

PATH=$HOME/.local/bin:$HOME/go/bin:$HOME/python-env/bin:$PATH

# Exports
export EDITOR="nvim"
export BROWSER="zen-browser"
export TERMINAL="st"

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# fnm
FNM_PATH="/home/felipe/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/felipe/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# pnpm
export PNPM_HOME="/home/felipe/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# opencode
export PATH=/home/felipe/.opencode/bin:$PATH
