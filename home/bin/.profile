#!/usr/bin/env sh

reset="\033[m"
red="\033[31m"
greenbold="\033[32;1m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"

nixshell() {
    if [[ $IN_NIX_SHELL ]]; then
        printf "%snix-shell%s " $greenbold $reset
    fi
}

gitstate() {
    branch=$(git branch --show-current 2>/dev/null)
    if [[ $? -eq 0 ]]; then
        printf "%sgit:%s%s " $greenbold $branch $reset
    fi
}

viassh() {
    if [[ $SSH_CLIENT ]]; then
        printf "%sssh%s " $greenbold $reset
    fi
}

prompt_command() {
    export PS1="\n${reset}[$(nixshell)$(gitstate)$(viassh)${reset}${cyan}\u@\h${reset}:${magenta}\w${reset}] $ "
}

PROMPT_COMMAND=prompt_command

# if [[ $(tty) = "/dev/tty1" ]]; then
#     read -p "Start X? (y/n)" choice
#     if [[ $choice = "y" ]]; then
#         startx
#         exit # Leave the current session when X closes
#     fi
# fi
