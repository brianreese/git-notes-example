#!/bin/bash

git_remote='origin'
if [ -n "$heimdall_git_remote" ]; then
  git_remote="$heimdall_git_remote"
fi

git_branch='master'
if [ -n "$heimdall_git_branch" ]; then
  git_branch="$heimdall_git_branch"
fi

tags=()
get_tags() {
  tags=("${tags[@]}" $(git notes show $1 | awk '/^heimdall_ignore/ {print $2}'))
}

for COMMIT in `git rev-list "$git_remote"/"$git_branch"..HEAD`; do 
  get_tags $COMMIT 2>/dev/null
done

(IFS=$','; echo "${tags[*]}")

