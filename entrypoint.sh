#!/bin/sh -l
set -x

git fetch origin "$INPUT_RESTORE_BRANCH"

if [ $? != 0 ]; then
  printf "Execution error $?"
  exit 1
fi

files=$(yq r trybe.yml 'ignore_files(.==*)')

for file in $files; do
  git restore --source "origin/$INPUT_RESTORE_BRANCH" -- "$file"
done
