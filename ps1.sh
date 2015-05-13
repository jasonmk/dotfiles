###  Bash shell prompt with RVM and Git info  ###
###  REQUIRES git-prompt.sh provided with Git ###

# $ cp git-prompt.sh ~/.git-prompt.sh
# $ echo source  ~/.git-completion.sh >> ~/.bashrc

# in ~/.bashrc
 BLACK="\e[30m"
   RED="\e[31m"
 GREEN="\e[32m"
YELLOW="\e[33m"
  BLUE="\e[34m"
PURPLE="\e[35m"
  CYAN="\e[36m"
 WHITE="\e[37m"

COLOR=$WHITE #default

function git_dirty {
  git status -s  2>/dev/null | sed /^#/d | wc -l | tr -d ' '
}

function git_repo {
  git rev-parse --show-toplevel
}

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
PS1="\\n\\n\
$PURPLE\$(git_dirty) \
$YELLOW\$(__git_ps1 \"#%s\")\
$COLOR \
\$(git_repo) \
\$(rvm-prompt)\
\\n\
[\w] "
