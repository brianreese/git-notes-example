#!/bin/bash

tags=$( IFS=$','; echo "$*")

git notes append -m "heimdall_ignore ${tags[*]}"

echo "${tags[*]}"



