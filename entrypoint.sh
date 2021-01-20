#!/bin/sh -l
set -x

git fetch origin "$INPUT_RESTORE_BRANCH"

if [ $? != 0 ]; then
  printf "Execution error $?"
  exit 1
fi

files=$(yq e '.ignore_files[]' trybe.yml)

for file in $files; do
  git restore --source "origin/$INPUT_RESTORE_BRANCH" -- "$file"
done
