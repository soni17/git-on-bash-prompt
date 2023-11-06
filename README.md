# git-on-bash-prompt
THis code adds git branch and status on bash prompt. The text in yellow shows the branch name and the red "x" indicates whether there's any staged or unstaged changes to the branch.

![screenshot](screenshot.png)
## Installation

Go to your home folder and open `.bashrc` file

Add the following code

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

Add `gitstuff` function to the end of your SP1 variable. See example below. Your SP1 variable might look different. Add to the end of variable.

    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(gitstuff) > '

Restart your terminal
