#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
# Authors Subraga Islammada S (Agaisme)
# Support Bash Version 4.3
# This file is taken from various sources
#######################################################
# Sunday, 11-Aug-2019

# Var Declare for Padding Options
declare symbol="-"
declare paddingSymbol=" "
declare lineLength=80
declare remainingLength=$(( lineLength - 2 ));

# Custom `select` implementation that allows *empty* input.
# Example: choice=$(selectWithDefault 'one' 'two' 'three')
function selectOptions() {
	local re='^[0-9]+$'
	local item i=0 numItems=$# 

	# Print numbered menu items, based on the arguments passed.
	for item; do         # Short for: for item in "$@"; do
		printf '%2s%s %s\n' "$((++i))" ")." "$item" 
	done >&2 # Print to stderr, as `select` does.

	# Prompt the user for the index of the desired item.
	while :; do
		printf "\n%s" "${prompt}" >&2 # Print the prompt string to stderr, as `select` does.
		read -r index
		# Make sure that the input is either empty or that a valid index was entered.
		if ! [[ "$index" -ge "0" && "$index" -le "$numItems" && ! -z "$index" && "$index" =~ $re ]] 2>/dev/null;
		then
			{ echo "Invalid selection. Please try again." >&2; continue; }
		fi
		break
	done

	# Output the selected item, if any.
	[[ -n $index ]] && printf %s "${index}"
}

function generatePadding() {
    local string="";
    for (( i=0; i < $2; i++ )); do
        string+="$1";
    done
    echo "$string";
}

function generateText() {
    totalCharsToPad=$((remainingLength - ${#1}));
    charsToPadEachSide=$((totalCharsToPad / 2));
    padding=$(generatePadding "$paddingSymbol" "$charsToPadEachSide");
    totalChars=$(( ${#symbol} + ${#padding} + ${#1} + ${#padding} + ${#symbol} ));
    if [[ ${totalChars} < ${lineLength} ]]; then
        echo "$(ansi --bold --green "${symbol}")${padding}$(ansi --bold --color=214 "${1}")${padding}${paddingSymbol}$(ansi --bold --green "${symbol}")";
    else
        echo "$(ansi --bold --green "${symbol}")${padding}$(ansi --bold --color=214 "${1}")${padding}$(ansi --bold --green "${symbol}")";
    fi
}

function generateTitle() {  
	local line
	line=$(generatePadding "${symbol}" "${lineLength}");

	local title=${1}
	ansi --bold --green "$line"
	generateText "${title}"
	ansi --bold --green "$line"
}

function generateOptions() {
	# Print the prompt message and call the custom select function.
	local -n options=${1}
	local -n functions=${2}
	local prompt
	prompt="$(ansi --inverse "Type in your choice (0-Exit/Cancel): ") "
	ANSWER=$(selectOptions "${options[@]}")
	# Process the selected item.
	case "$ANSWER" in
	 "$ANSWER") 
		if [[ "${ANSWER}" -gt "0" && "${ANSWER}" -le "${#options[@]}" ]]; then
			${functions[$ANSWER]} 2>&1
		elif [[ ${ANSWER} -eq "0" ]]; then
			${functions[$ANSWER]} 2>&1
		else
			echo "You typed wrong, Please type in the ordinal number on the list";
		fi
		;;
	''|*) 
		echo "You typed wrong, Please type in the ordinal number on the list";;
	esac
}

function generateMenu() {
	generateTitle "$1"
    generateOptions "$2" "$3"
}

function menu_show() {
	local -a opts=(
		"Setup LEMP Stack" 
		"Add User Deployer" 
		"Add Nginx VHost" 
		"Create MariaDB Databases and Users" 
		"Backup"
		)
	local -a func=(
		"functionOption0" 
		"functionOption1"
		"functionOption2"
		"functionOption3"
		"functionOption4"
		"functionOption5"
		)
	local title="Main Menu"
	generateMenu "$title" opts func
}

function functionOption0() {
	# Exit or Cancel
	ansi --bold --green "Bye!"
	exit 1;
}

function functionOption1() {
	lemp_stack_menu
	# nginx_menu
	# mariadb_menu "clean"
	# "Install LEMP Stack"
}
function functionOption2() {
	echo "Add User Deployer"
}
function functionOption3() {
	echo "Add Nginx VHost"
}
function functionOption4() {
	echo "Add MariaDB Databases and Users"
}
function functionOption5() {
	echo "Backup"
	#  WIP
}

function back_main_menu() {
	main
}
	


# =========================================================================
#                         Setup Server Wizard
# =========================================================================
# # [Install Options]
# User Deployer
# Install LEMP
# Choose Version of LEMP Stack or Default
# Fill Out Configuration of Lemp Stack
# Confirmation of Setup Server Configuration

# # [Additional]
# Add Vhost/Block Server
# Add Table/User Mysql Server

# # [Text of Install Options]
# Do you wanna add user as a deployer ?
# Yes or No :

# Type your name as a deployer user (default:deployer) : ...
# Type your password as a deployer user : ...



# ==========================================================================
# Please Correct Information Below:
# ==========================================================================
# Nginx Version : 7.1 Stable Version
# --------------------------------------------------------------------------
# MariaDB Version : 10.2
# --------------------------------------------------------------------------
# PHP Version : 7.1
# --------------------------------------------------------------------------
# Username as a deployer : deployer
# --------------------------------------------------------------------------
# Password as a deployer : 123456789
# --------------------------------------------------------------------------
# MariaDB Port : 3306
# --------------------------------------------------------------------------
# Password for root of MariaDB : random123456
# ==========================================================================
# 1) Agree
# 2) Do Not Agree
# Type in your choice: 1



# =========================================================================
#                             Server Status
# =========================================================================
# Your IP Server : 0.0.0.0
# -------------------------------------------------------------------------
# PHP Status: Running
# Nginx Status: Running
# MySQL Status: Running
# PHP version: 7.1.25
# Nginx version: nginx/1.14.2
# MySQL version

