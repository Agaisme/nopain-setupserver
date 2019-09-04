#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
#######################################################

function mariadb_menu(){
	if [[ ! -z ${1+x} ]] && [[ ${1} == "clean" ]]; then
		clear
		image_head
	fi 
	local -a opts=(
		"MariaDB Install (Latest)" 
		)
	local -a func=(
		"back_main_menu"
		"mariadb_install"
		)
	local title="Choose Your MariaDB/MySQL Version"
	generateMenu "$title" opts func
}

function mariadb_initiate() {
	echo "MariaDB Initiate"
}

function mariadb_install(){
	echo "MariaDB Install"
	# yum -y install --skip-broken mariadb-server mariadb
}

function mariadb_check_installed() {
	mysql --version 2>/dev/null > /dev/null
	if [[ $? == 0 ]]; then
		ansi --bold --green "Installed"
	else
		ansi --bold --red "Not Installed"
	fi
}