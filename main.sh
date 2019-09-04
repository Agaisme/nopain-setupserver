#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
# Authors Subraga Islammada S (Agaisme)
# Support Bash Version 4.3
# This file is taken from various sources
#######################################################
# Sunday, 11-Aug-2019

# Load Support File
CURRENT_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
source "${CURRENT_DIR}/loader.sh"

# set locale temporarily to english
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

function main() {
	clear
	image_head
	pc_info
	menu_show
}

main

