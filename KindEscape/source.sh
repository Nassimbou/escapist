#!/bin/bash
while :
do
	[[ "${BASH_SOURCE[0]}" != "${1}" ]] && echo "script ${BASH_SOURCE[0]} is being sourced ..."
	sleep 1
done
