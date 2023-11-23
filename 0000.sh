#!/bin/bash

# require "go" param
if [ "$1" != "go" ] ; then
	echo "no go"
	exit 1
fi

# require pnmp
if ! command -v pnpm > /dev/null 2>&1 ; then
	echo "pnpm required"
	exit 1
fi

# require Git folder
if [ ! -d ./.git ] ; then
	echo "git folder not found"
	exit 1
fi

# require Next config file
if [ ! -f ./next.config.js ] ; then
	echo "next config not found"
	exit 1
fi

# add unique command to Husky hook
function add_to_husky_hook()
{
	HOOK=$1
	CMD=$2

	if ! grep -q "$CMD" .husky/$HOOK ; then
		pnpm exec husky add .husky/$HOOK "$CMD"
	fi
}

# append command to nmp script
function append_to_npm_script()
{
	SCRIPT=$1
	CMD=$2
	PREV=$(pnpm pkg get scripts.$SCRIPT | sed -e 's/^"//' -e 's/"$//' -e "s/^'//" -e "s/'$//")

	if grep -q "$CMD" <<< "$PREV" ; then
		return
	fi

	if [ -z "$PREV" -o "$PREV" = "{}" ] ; then
		pnpm pkg set scripts.$SCRIPT="$CMD"
	else
		pnpm pkg set scripts.$SCRIPT="$PREV && $CMD"
	fi

	echo "$SCRIPT = $(pnpm pkg get scripts.$SCRIPT)"
}

# commit changes
function commit_all_changes()
{
	MSG=$1

	git add -A .
	git commit -a -m "$MSG" --no-verify
}
