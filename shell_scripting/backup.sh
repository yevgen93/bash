#!/bin/bash

log() {
	local MESSAGE="${@}"
	echo "$MESSAGE"
}


# This script makes a backup of a file. Returns a non-zero status on error.

backup_file() {
	local FILE="${1}"

	# Make sure the file exists
	if [[ -f "${FILE}" ]]
	then
		local BACKUP_FILE="/Users/zheu9001/Desktop/$(basename ${FILE}).$(date +%F)"
		log "Backing up ${FILE} to ${BACKUP_FILE}."
		
		# The exit status of the function will be the exit status of the cp command
		cp -p ${FILE} ${BACKUP_FILE}
	else
		# The file does not exist so return a non-zero exit status
		return 1
	fi
}

backup_file 'testfile'

if [[ "${?}" -eq "0" ]]
then
	log "File backup succeeded!"
else
	log "File backup failed!"
	exit 1
fi
