#!/bin/bash

while getopts "c:" opt; do
  case $opt in
    c)
      if [ ! -z "$2" ]; then
              printf "Password:"
        read -s passw
        [ ! -d "/home/ubuntu/sites/${2}" ] && mkdir -p "/home/ubuntu/sites/${2}"
        docker run -d --name "${2}-nginx" -e VIRTUAL_HOST="${2}.frontendvo.com" -v "/home/ubuntu/sites/${2}":/var/www/html/website dockermd/nginx
        echo "Created: ${2}.frontendvo.com"
        docker exec -d sshd /root/bin/cnu ${2} $passw
      else
        >&2 echo "Error: d option requires two arguments."
        exit 1
      fi
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done
