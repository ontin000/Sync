# Path to your oh-my-zsh configuration.
ZSH=~/Sync/oh-my-zsh/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sax="ssh amdhead"
alias slh="ssh linuxhead"
alias sbx="ssh sbx"
alias ssx="ssh secbox"
alias Syu="sudo pacman -Syu"
alias du="du -h --max-depth 1"
alias pacman-disowned-dirs='comm -23 <(sudo find / \( -path '\''/dev'\'' -o -path '\''/sys'\'' -o -path '\''/run'\'' -o -path '\''/tmp'\'' -o -path '\''/mnt'\'' -o -path '\''/srv'\'' -o -path '\''/proc'\'' -o -path '\''/boot'\'' -o -path '\''/home'\'' -o -path '\''/root'\'' -o -path '\''/media'\'' -o -path '\''/var/lib/pacman'\'' -o -path '\''/var/cache/pacman'\'' \) -prune -o -type d -print | sed '\''s/\([^/]\)$/\1\//'\'' | sort -u) <(pacman -Qlq | sort -u)'
alias pacman-disowned-files='comm -23 <(sudo find / \( -path '\''/dev'\'' -o -path '\''/sys'\'' -o -path '\''/run'\'' -o -path '\''/tmp'\'' -o -path '\''/mnt'\'' -o -path '\''/srv'\'' -o -path '\''/proc'\'' -o -path '\''/boot'\'' -o -path '\''/home'\'' -o -path '\''/root'\'' -o -path '\''/media'\'' -o -path '\''/var/lib/pacman'\'' -o -path '\''/var/cache/pacman'\'' \) -prune -o -type f -print | sort -u) <(pacman -Qlq | sort -u)'
alias cp="/usr/bin/cp -i"
alias rm="/usr/bin/rm -f"
alias mv="/usr/bin/mv -i"

export VISUAL=vim
export EDITOR=vim

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile.$HOST
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install

autoload -U compinit promptinit
compinit
promptinit

# This will set the default prompt to the walters theme
#prompt walters

autoload -U colors && colors

#if [[ -z "$SSH_CLIENT" ]]; then
#	PROMPT="[%{$fg[red]%}%n%{$reset_color%}@%{$fg[magenta]%}%m %{$fg_no_bold[yellow]%}%~%{$reset_color%}] $ "
#else
#	PROMPT="$SSH_STATUS:${STY}:[%{$fg[red]%}%n%{$reset_color%}@%{$fg[magenta]%}%m %{$fg_no_bold[yellow]%}%~%{$reset_color%}] $ "
#fi

## SSH for PROMPT
if [[ -n "$SSH_CLIENT" ]]; then
	SSH_STATUS="SSH:"
else
	SSH_STATUS=""
fi

## SCREEN for PROMPT

ATERM="$(echo $TERM | cut -b 1-6)"
if [[ "$ATERM" == "screen" ]]; then
	STY_STATUS="${STY}:"
else
	STY_STATUS=""
fi

## ROOT CHARACTER for PROMPT
if [[ "$(whoami)" == "root" ]]; then
  PMT_CHAR="#"
  USER_COLOR="red"
else
  PMT_CHAR="$"
  USER_COLOR="cyan"
fi

PROMPT="${SSH_STATUS}${STY_STATUS}[%{$fg[${USER_COLOR}]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg_no_bold[white]%}%~%{$reset_color%}] ${PMT_CHAR} "

#typeset -U path
#path=($PATH)
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/opencascade/bin:/usr/bin/core_perl:~/bin:~/.npm-global/bin:~/.cargo/bin


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

~/Sync/banner.sh
