#!/bin/bash

#this script fetches a list of installed packages & version and it will also report missing packages from the list
#this script presents output in a parseable format & doesn't require user input. Syntax: bash ./fetchPackages.sh

#array to easily add or remove packages
PACKAGES=(
	grep
	mount
	sed
	procsp
	php
)

#loop thru the array of packages
for x in ${PACKAGES[@]}
do
	dpkg -l $x 2>/dev/null | awk 'NR==6{print $2,"v"$3}' #supress dpkg stderr & print only package name & version output
	dpkg -l $x >/dev/null 2>&1 || echo "$x NOT FOUND" #supres dpkg stdo/stderr & print only non-zero exit code output
done

exit