#Home
export PATH=~/bin:$PATH
#Grep color
export GREP_OPTIONS="-n --color"
#Bash Editor
export EDITOR=vim
export VISUAL=vim
#Bash colors
export LSCOLORS=ExGxFxdxCxegedhbagacec
#Ignore dups in bash history
export HISTCONTROL=ignoredups

# PS1 COLORS
if [ "$UID" != "0" ]; then
   UID_COLOR='\[\e[0;32m\]'
   UID_BG='\[\e[42m\]'
   UID_CHAR='λ'
else
   UID_COLOR='\[\e[0;31m\]'
   UID_BG='\[\e[41m\]'
   UID_CHAR='#'
fi
COLOR_RESET='\[\e[0m\]'
CHAR_COLOR='\[\e[1;35m\]'
PATH_COLOR='\[\e[0;36m\]'
PS1="${UID_BG}${UID_COLOR}\u@\h ${PATH_COLOR}[\w] ${COLOR_RESET}${CHAR_COLOR}${UID_CHAR}${COLOR_RESET} "

#Git branch info
export PSORIG="$PS1"
function GITBRANCH() {
  branch="$(git branch 2>/dev/null | grep '*' | cut -d" " -f2-)"
  dirty="$(git status -s 2>/dev/null)"
  if [ -n "$dirty" ] ; then
    color="1;33m"
  else
    color="0;33m"
  fi

  if [ -n "$branch" ] ; then
    export GITINFO=$(echo -en "\[\033[$color\][$branch] ")
    export PS1="${UID_BG}${UID_COLOR}\u@\h ${PATH_COLOR}[\w] ${GITINFO}${COLOR_RESET}${CHAR_COLOR}${UID_CHAR}${COLOR_RESET} "
  else
    export PS1="${PSORIG}"
  fi
}
PROMPT_COMMAND="GITBRANCH"

#Aliases
alias r='sudo -E bash -l'
alias ls='ls -FGA'
alias lsl='ls -l'
alias ..='cd ..'
alias ...='cd ../..'
alias subl='open -a "Sublime Text"'

alias ga='git add'
alias gc='git commit'
alias gch='git checkout'
alias gf='git fetch'
alias gd='git diff HEAD .'
alias gps='git push'
alias gpl='git pull'
alias gs='git status'
alias gl='git log'
alias gra='git clean -df;git checkout -- .' # Discard all local changes

gitBranchDeleteRemote() {
  git branch -d -r origin/$1
  git config --unset branch.$1.remote
  git config --unset branch.$1.merge
  git push origin :$1
}
alias gbdr=gitBranchDeleteRemote # Delete remote branch
alias gbd='git branch -d' # Delete local branch
alias gbc='git checkout -b' # Create new branch
