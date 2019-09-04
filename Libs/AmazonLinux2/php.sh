#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
#######################################################

# set -o nounset    # Exposes unset variables
# set -o errexit    # Used to exit upon error, avoiding cascading errors

function php_menu(){
	clear
	local -a opts=(
		"PHP 7.3 (Default)" 
		"PHP 7.2" 
		"PHP 7.1" 
		"PHP 5.6" 
		)
	local -a func=(
		"back_main_menu"
		"php73"
		"php72"
		"php71"
		"php56"
		)
	local title="Choose Your PHP Version"
	generateMenu "$title" opts func
}

function php_initiate() {
	echo "Php Initiate"
}

function php_install(){
	echo "PHP Install"
	# yum -y install php 
	# yum -y install --skip-broken php-common php-cli php-mbstring php-xml php-zip php-curl php-json php-pdo  php-intl php-bcmath php-devel php-gd php-mcrypt php-pear php-ctype php-soap php-xmlrpc
}

function php73() {
	echo "PHP 73"
	declare php_version_issued="php73"
	php_initiate
	# yum-config-manager --enable remi-php73 
	# php_install
}
function php72() {
	echo "PHP 72"
	declare php_version_issued="php72"
	php_initiate
	# yum-config-manager --enable remi-php72
	# php_install
}
function php71() {
	echo "PHP 71"
	declare php_version_issued="php71"
	php_initiate
	# yum-config-manager --enable remi-php71
	# php_install
}
function php56() {
	echo "PHP 56"
	declare php_version_issued="php56"
	php_initiate
	# yum-config-manager --enable remi-php56
	# php_install
}

function php_check_installed() {
	php -v 2>/dev/null > /dev/null
	if [[ $? == 0 ]]; then
		ansi --bold --green "Installed"
	else
		ansi --bold --red "Not Installed"
	fi
}