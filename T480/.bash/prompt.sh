#!/bin/sh

find_git_branch() {
    # Based on: http://stackoverflow.com/a/13003854/170413
    local branch
    git_branch=$(git branch 2>/dev/null|grep '^*'|colrm 1 2)
    if [ -z "$git_branch" ]
    then
        git_branch="$git_branch"
    else
        git_branch="($git_branch)"
    fi
}

if [ -n "$PROMPT_COMMAND" ]; then
    PROMPT_COMMAND="find_git_branch;$PROMPT_COMMAND"
else
    PROMPT_COMMAND="find_git_branch"
fi
