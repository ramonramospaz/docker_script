#!/bin/bash

if [ -z "$1" ]
	then
		echo "Usage:	check_docker_error COMMAND"
		echo " "
		echo "check_docker_error.sh {{docker_container_name}} {{*lines_after_error}} "
		echo "*lines_after_error is optional, by default is 3"
	   	echo " "
		echo "{{docker_container_name}}"
		sudo docker ps --all --format {{.Names}}
fi

if [ -z "$2" ]
	then
		sudo docker logs $1 2>&1 | grep -A3 --color=always  " ERROR "
else
		sudo docker logs $1 2>&1 | grep -A$2 --color=always  " ERROR "

fi
