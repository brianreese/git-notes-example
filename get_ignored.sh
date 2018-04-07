#!/bin/bash

tags=()

get_tags() {
  tags=("${tags[@]}" $(git notes show $1 | awk '/^heimdall_ignore/ {print $2}'))
}

for COMMIT in `git rev-list github/master..HEAD`; do 
  get_tags $COMMIT 2>/dev/null
done

(IFS=$','; echo "${tags[*]}")

