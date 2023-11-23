#!/bin/bash

. "$(dirname -- "$0")/0000.sh" go

# Telemetry
append_to_npm_script "prepare" "next telemetry disable"

# Husky
pnpm install -D husky@latest
append_to_npm_script "prepare" "husky install"
pnpm run prepare

# Pre-commit
pnpm exec husky set .husky/pre-commit "git config --local --list"
pnpm exec husky add .husky/pre-commit "pnpm run lint"

# Commit
commit_all_changes "Quickstart: Telemetry & Husky"

