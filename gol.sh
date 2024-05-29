#!/bin/sh

#######################################################
# GOL                                                 #
#######################################################
# This project is an art project of a kind.           #
# The idea is that the files it generates can be read #
# as both the file itself, and via git log, which     #
# is traditionally oriented in reverse.               #
#######################################################

if [ -z "$1" ]; then
	echo 'gol <input:file> <output:zip>'
	echo ''
	head "$0" -n 10 | tail -n +2
	exit 0
fi

wd="$(mktemp -d)"

# Create the base file, so we can alter it:
cp "$1" "$wd"'/file'
fname="$(basename "$1")"

# Make sure the base file is even:
linecount="$(wc -l "$wd"'/file' | awk '{print $1}')"
while ! [ $((linecount % 2)) -eq 0 ]; do
	echo '' >> "$wd"'/file'
	linecount="$(wc -l "$wd"'/file' | awk '{print $1}')"
done

# Create our basic git setup:
git init "$wd"
git --git-dir="$wd/.git" --work-tree="$wd" branch -m 'art'

# Iterate our base file:
n=0
while [ "$n" -le "$linecount" ]; do
	# Copy line N to file.
	head -n "$n" "$wd"'/file' | tail -n 1 >> "$wd"'/'"$fname"
