#!/bin/bash

CHANGED_FILES=`git diff --name-only --diff-filter=d master | grep ".rb" | paste -sd " " -`

CMD="bundle exec rubocop ${CHANGED_FILES}"

if [[ "${CHANGED_FILES}" ]]; then
  echo "Executing: ${CMD}"
  $CMD
fi
