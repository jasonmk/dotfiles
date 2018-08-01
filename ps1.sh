function git-branch-name {
  echo $(git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

function git-dirty {
  if ! git status -uno 2>/dev/null | grep -q "nothing to commit"
  then
    echo "*"
  fi
}

function git-unpushed {
  brinfo=$(git branch -v | grep $(git-branch-name))
  if [[ $brinfo =~ ("[ahead "([[:digit:]]*)]) ]]
  then
    echo "(${BASH_REMATCH[2]})"
  fi
}

function git-untracked {
  git ls-files --others --exclude-standard --error-unmatch -- '*' > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "%"
  fi
}

PS1='\[\e[0;36m\]\T \d \[\e[1;30m\][\[\e[1;33m\]\u\[\e[1;34m\]@\h\[\e[1;30m\]\[\e[0;32m\]$(git branch &>/dev/null; if [ $? -eq 0 ]; then echo " ($(git-branch-name) $(git-dirty)$(git-untracked)$(git-unpushed))"; fi)\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\] \n($SHLVL:\!)\$ '

export PS1
