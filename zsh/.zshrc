# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config//zsh//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# for reconfiguration: p10k configure
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

#cargar aliasrc si es que existe
[ -f "${ZDOTDIR}/aliasrc" ] && source "${ZDOTDIR}/aliasrc"
[ -f "${ZDOTDIR}/optionrc" ] && source "${ZDOTDIR}/optionrc"

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Bind Ctrl + Left and Ctrl + Right to move by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# history
# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=110000
SAVEHIST=100000
HISTFILE=~/.zsh_history

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-downa

export VISUAL=/usr/local/bin/nvim
export EDITOR=/usr/local/bin/nvim

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# To customize prompt, run `p10k configure` or edit ~/.config//zsh//.p10k.zsh.
[[ ! -f ~/.config//zsh//.p10k.zsh ]] || source ~/.config//zsh//.p10k.zsh

#plugins
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/plugins/zsh-history-substring-search/zsh-history-substring-search.plugin.zsh

