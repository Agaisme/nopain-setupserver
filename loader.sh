#!/bin/bash

# Load Support File
SOURCE_FILE=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
for x in "${SOURCE_FILE}/Utils/"*.sh; do source "${x}"; done
for y in "${SOURCE_FILE}/Libs/AmazonLinux2/"*.sh; do source "${y}"; done

