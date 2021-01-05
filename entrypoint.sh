#!/bin/sh -l
set -x

git pull origin "$INPUT_RESTORE_BRANCH" --ff-only --allow-unrelated-histories

files=$(yq r .trybe/config.yml 'ignore_files(.==*)')

for file in $files; do
  git restore --source origin/master -- "$file"
done
