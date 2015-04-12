#!/bin/bash

if [ "${1}" = "-h" ]
then
    printf "Password:"
	read -s passw
	[ ! -d "/home/ubuntu/sites/${2}" ] && mkdir -p "/home/ubuntu/sites/${2}"
	docker run -d --name "${host}-nginx" -e HOSTNAME="${host}.frontendvo.com" -v "/home/ubuntu/sites/${host}":/var/www/ nginx
	docker exec -d ubuntu-ssh ['/puto/comando', '$host', '$passw']
fi