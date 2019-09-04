#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
# Authors Subraga Islammada S (Agaisme)
# Support Bash Version 4.3
# This file is taken from various sources
#######################################################

UTILS_DIR=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

export LOG_PATH=${UTILS_DIR}/../init.log

call_function() {
    #Assign Args
    function=$1
    description=$2
    logfile=$3

    #Run Function
    echo -n "===>"
    $function >> ${logfile} 2>&1

    #Check Return Status
    return_status=$?
    echo -n ' ['
    if [[ $return_status -eq 0 ]]; then
        ansi --bold --green --no-newline "DONE"
    else
        ansi --bold --red --no-newline "ERROR"
    fi
    echo "] ${description}..."
}