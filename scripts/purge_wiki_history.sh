#!/bin/bash

if [[ ! -d Microcontroller-Breadboard.wiki/.git ]] ; then
	echo "Must be run from above the Microcontroller-Breadboard.wiki repo." >&2
	exit 1
fi

set -e # short-circuit if any command fails
cd Microcontroller-Breadboard.wiki
rm -rf .git
git init
git add .
git commit -m "Purged wiki history."
git config pull.rebase false
git remote add origin git@github.com:LloydAlbin/Microcontroller-Breadboard.wiki.git
git push -u --force origin master
