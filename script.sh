# show git branch in bash prompt
gitstuff() {
    gitstatus=`git status 2>/dev/null`
    gitrepo=$?
    nochanges=`git status 2>/dev/null | grep "nothing to commit"`
    gitbranch=`git status 2>/dev/null | grep "On branch" | awk '{print $3}'`
    indicator=""
    if [ -z "$nochanges" ]; then indicator="\001\e[00;31m\002x\001\e[00m\002"; fi
    if [ $gitrepo = 0 ]; then echo -e "\001\e[00;33m\002($gitbranch)\001\e[00m\002$indicator"; fi
}
