#!/bin/bash

# catch non-bash and non-interactive shells
[[ $- == *i* && $BASH_VERSION ]] && SHELL=/bin/bash || return 0

# set some defaults
export MANWIDTH=100
export HISTSIZE=10000
export HISTIGNORE="q:f:v"

# colors in less (manpager)
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'

# ensure ~/bin is on the path
[[ $PATH =~ ~/bin ]] || PATH=~/bin:$PATH

set -o vi
set -o notify

shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify
[[ $DISPLAY ]] && shopt -s checkwinsize

# prompt if file sourcing below fails
PS1='[\u@\h \W]\$ '

#---- new bash prompt

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters

# export PROMPT_LNBR1=''
# export PROMPT_MULTILINE=''
# export PROMPT_USERFMT='\u\[\e[0m\]@\[\e[31m\]\h '

# source shell configs
for f in "$HOME/.bash/"*?.bash; do
    . "$f"
done

al-info

# changing the $EDITOR to nvim
export VISUAL=nvim
export EDITOR="$VISUAL"

# NNN

# export NNN_BMS="d:~/Downloads;o:~/OneDrive"
# export NNN_USE_EDITOR=1
# export NNN_CONTEXT_COLORS="4"
# export NNN_COPIER="~/scripts/copier.sh"
# export NNN_FALLBACK_OPENER=xdg-open

# setting term
export TERM=st-256color

# aliases below
alias vim='nvim'
alias sb='cd && source .bashrc && clear && ufetch'
alias vb='cd && nvim .bashrc'
alias i3l='rofi_run -l'
alias rm='rm -rf'
alias lsl='ls -ll'
alias lsa='ls -al'
alias mkcd='mkdir %a | cd %a'

# git
alias gg='git status'
alias gc='git commit -m'
alias gs='git stage'
alias ga='git add .'
alias gf='git fetch'
alias gp='git pull'
alias checkout='git checkout'
alias gm='git merge'

# Pacman
alias mirror='sudo pacman -Syuw && clear && ufetch'

## for applications
alias ydl='youtube-dl -i'
alias f='uskb && vifm'
alias l='clear && ufetch'
alias dmenu_run="dmenu_run -nb '#2e3440' -sf '#2e3440' -nf '#bf616a' -sb '#bf616a'"

# changing keyboard layout - usekeybinding later
alias uskb='setxkbmap -layout us -variant mac'
alias inkb='setxkbmap -layout us -variant intl'

## access config files
alias i3conf='nvim ~/.config/i3/config'
alias qtconf='nvim ~/.config/qutebrowser/config.py'
alias xresconf='nvim ~/.Xresources'
alias vimconf='nvim ~/.config/nvim/init.vim'
alias vifmconf='nvim ~/.config/vifm/vifmrc'
alias newsconf='nvim ~/.newsboat/urls'

## recurrent use
alias fehbg='feh --bg-scale'
alias weather='curl wttr.in' # requires curl
alias fire='aafire -driver curses -dim' # requires aalib
alias sx='sxiv -f *.jpg *.png *.gif'
alias mutt='neomutt'

## faster encryption
alias encrypt='openssl aes-256-cbc -a -pbkdf2' #-a show as text
alias decrypt='openssl aes-256-cbc -d -a -pbkdf2' 

## xrandr
alias dell='xrandr --output HDMI1 --mode 1920x1080 --output LVDS1 --primary --scale 1.5x1.35 && ~/.fehbg && l'
alias mac='xrandr --output LVDS1 --primary --scale 1x1 && ~/.fehbg && l'

## wifi kernel module
alias wifi='sudo modprobe -v b43'

## scripts
alias pacui='bash ~/pacui'

##ufetch
alias ufetch='clear && ufetch'
# -- more functions
