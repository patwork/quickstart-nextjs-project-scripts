#!/bin/bash

. "$(dirname -- "$0")/0000.sh" go

# move favicon
test -f ./app/favicon.ico && mv -v ./app/favicon.ico ./public/

# remove cache
test -d ./.next && rm -rfv ./.next

# format
pnpm run format:fix

# Commit
commit_all_changes "Quickstart: General cleanup and formatting"

