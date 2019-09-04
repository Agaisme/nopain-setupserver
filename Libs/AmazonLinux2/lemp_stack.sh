#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
#######################################################
# Setup Your Server as LEMP STACK Preferences (Additional Optimize for Laravel)
# Tested on CentOS 6 / Amazon Linux 2
function lemp_stack_menu(){

	clear
	image_head
	generateTitle "Server Status"
	printf "Nginx Status\t: %s\n" "$(nginx_check_installed)"
	printf "PHP Status\t: %s\n" "$(php_check_installed)"
	printf "MariaDB Status\t: %s\n" "$(mariadb_check_installed)"
	local -a opts=(
		"Install LEMP Stack" 
		"Check This Server[WIP]" 
		)
	local -a func=(
		"back_main_menu"
		"lemp_install"
		)
	local title="LEMP Stack Wizard"
	generateMenu "$title" opts func
}

# Next Feature for Version Selection
# function lemp_issued(){
# 	nginx_menu
# 	php_menu
# 	mariadb_menu
# 	sleep 1
# 	lemp_stack_menu
# }

function lemp_install() {
	call_function nginx_install "Installing Nginx..." ${LOG_PATH}
	call_function php_install "Installing Nginx..." ${LOG_PATH}
	call_function mariadb_install "Installing Nginx..." ${LOG_PATH}
	sleep 1
	lemp_stack_menu
}
















# yum clean all

# NGINX

# PHP

# MARIADB
