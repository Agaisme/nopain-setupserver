#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
# Authors Subraga Islammada S (Agaisme)
# Support Bash Version 4.3
# This file is taken from various sources
#######################################################

function image_head(){
	love="$(ansi --red "♥")"
	logo="
$(ansi --bold --green "   _  __     ___       _      ") $(ansi --bold --red " _____       _                _____                          ")
$(ansi --bold --green "  / |/ /__  / _ \___ _(_)__   ") $(ansi --bold --red "|   __| ___ | |_  _ _  ___   |   __| ___  ___  _ _  ___  ___ ")
$(ansi --bold --green " /    / _ \/ ___/ _ \`/ / _ \\")   $(ansi --bold --red "|__   || -_||  _|| | || . |  |__   || -_||  _|| | || -_||  _|")
$(ansi --bold --green "/_/|_/\___/_/   \_,_/_/_//_/  ") $(ansi --bold --red "|_____||___||_|  |___||  _|  |_____||___||_|   \_/ |___||_|  ")
 Built with $love by Agaisme (c) 2019        $(ansi --bold --red "            |_|                                    ")
	";       

	echo "$logo";
}