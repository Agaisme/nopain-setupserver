#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
#######################################################

function nodejs_menu(){
	clear
	local -a opts=(
		"NodeJS Install (Latest)" 
		)
	local -a func=(
		"back_main_menu"
		"nodejs_install"
		)
	local title="Choose Your NodeJS Version"
	generateMenu "$title" opts func
}

function nodejs_initiate() {
	echo "NodeJS Initiate"
}

function nodejs_install(){
	echo "NodeJS Install"
	# yum -y install --skip-broken nodejs
}

function nodejs_check_installed() {
	npm --version 2>/dev/null > /dev/null
	if [[ $? == 0 ]]; then
		ansi --bold --green "Installed"
	else
		ansi --bold --red "Not Installed"
	fi
}