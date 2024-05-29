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
