#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
#######################################################

function nginx_menu(){
	clear
	local -a opts=(
		"Nginx Stable Version (Default)" 
		"Nginx Mainline Version" 
		)
	local -a func=(
		"back_main_menu"
		"nginx_install_stable"
		"nginx_install_mainline"
		)
	local title="Choose Your NGINX Version"
	generateMenu "$title" opts func
}

function nginx_initiate() {
	echo "Nginx Initiate"
	# WIP FOR Amazon Linux 2
	# local RELEASEVER=RELEASEVER
	# local BASEARCH=BASEARCH

	# #Setup Yum Repo for Nginx
	# cat << _EOF_ > /etc/yum.repos.d/nginx.repo
	# [nginx-stable]
	# name=nginx stable repo
	# baseurl=https://nginx.org/packages/centos/$RELEASEVER/$BASEARCH/
	# gpgcheck=1
	# enabled=1
	# gpgkey=https://nginx.org/keys/nginx_signing.key

	# [nginx-mainline]
	# name=nginx mainline repo
	# baseurl=https://nginx.org/packages/mainline/centos/$RELEASEVER/$BASEARCH/
	# gpgcheck=1
	# enabled=0
	# gpgkey=https://nginx.org/keys/nginx_signing.key
	# _EOF_
}

function nginx_install() {
	echo "Nginx Install"
	# yum -y install nginx
	# nginx
}

function nginx_install_stable() {
	echo "Nginx Stable"
	declare nginx_version_issued="stable"
	# #If Choose Stable
	nginx_initiate
	# yum-config-manager --enable nginx-stable
	# nginx_install
}

function nginx_install_mainline() {
	echo "Nginx Mainline"
	declare nginx_version_issued="mainline"
	# #If Choose Mainline
	nginx_initiate
	# yum-config-manager --enable nginx-mainline
	# nginx_install
}

function nginx_check_installed() {
	nginx -t 2>/dev/null > /dev/null
	if [[ $? == 0 ]]; then
		ansi --bold --green "Installed"
		# curl -I 127.0.0.1
	else
		ansi --bold --red "Not Installed"
	fi
}