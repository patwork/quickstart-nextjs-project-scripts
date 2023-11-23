#!/bin/bash

# project directory
if [ "$1" = "" ] ; then
	echo USAGE: $0 project-directory
	exit 1
fi

# Create Next App
pnpm dlx create-next-app@latest --ts --tailwind --eslint --app --src-dir --use-pnpm --import-alias "@/*" "$1"
cd "$1"

# Optional Git config
if command -v git-init-github-patwork > /dev/null 2>&1 ; then
	test -d .git && rm -rf .git
	git-init-github-patwork
	git add -A .
	git commit -a -m "Initial commit from Create Next App."
fi
