#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
# Authors Subraga Islammada S (Agaisme)
# Support Bash Version 4.3
# This file is taken from various sources
#######################################################

function pc_info(){
	# Check OS
	OS_NAME=$(cat /etc/*-release | sed -e 's/\"//g' |sed -n "s/^PRETTY_NAME=//p") >& /dev/null

	if [[ $? -eq 0 ]]; then
		{ echo "$(ansi --bold "$(id -u -n)"@"$(hostname)") is your user and hostname to run this application" ; echo "$(ansi --bold "$OS_NAME") is your OS Version"; }
	else
		{ echo "Unknown Hostname, User and OS Version"; }
	fi

	# Check User Permission
	if [[ "$(id -u)" -ne "0" ]]; then
		{ echo "Please execute this script with the $(ansi --bold --bg-red "sudo") access !"; exit 1; } 
	else
		{ echo -e "$(ansi --inverse --color=214 "Becareful you're in root access !\n")"; }
	fi
}
