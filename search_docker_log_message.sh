#!/bin/bash

arr=($@)
I=0
for var in $@ 
do
	if [ $I -gt 1 ]
	then
		SEARCH_TEXT+="$var "
	fi
	I=$((I+1))	
done

if [ -z "${arr[0]}" -o  -z "${arr[1]}" ] 
        then
                echo "Usage:   search_docker_log_message.sh COMMAND"
                echo " "
                echo "search_docker_log_message.sh {{docker_container_name}} {{lines_before_after_error}} {{string_to_search}} "
                echo "Example ./search_docker_log_message.sh 4told-dev 5 ERROR "
                echo " "
                echo "{{docker_container_name}}"
                sudo docker ps --all --format {{.Names}}
else
	
               	sudo docker logs ${arr[0]} 2>&1 | grep -C${arr[1]} --color=always "$SEARCH_TEXT"

fi
