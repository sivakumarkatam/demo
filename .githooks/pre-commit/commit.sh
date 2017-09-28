#!/bin/sh

# set this to your active development branch
#develop_branch="develop"
#current_branch="$(git rev-parse --abbrev-ref HEAD)"

# only check commit messages on main development branch
#[ "$current_branch" != "$develop_branch" ] && exit 0

# regex to validate in commit msg
#commit_regex='(wap-[0-9]+|merge)'
commit_regex="updated"
error_msg="Aborting commit. Your commit message is missing either a JIRA Issue ('WAP-1111') or 'Merge'"
echo "$1"
MESSAGE=$(git log -1 HEAD --pretty=format:%s)
echo "$MESSAGE"
#if grep "$commit_regex" "$MESSAGE"; then
if [[ ${commit_regex} != ${1} ]]; then 
#if ! grep -iE "$commit_regex" "$1"; then
   echo "$error_msg" >&2
    exit 1
fi

#MSG="$1"

#if ! grep -qE "updated" "$MSG";then
#    cat "$MSG"
#    echo "Your commit message must contain the word 'updated'"
 #   exit 1
#fi
