#!/bin/bash

command="docker-compose ${@}"
if [ "${command}" == "docker-compose down" ]; then 
	/bin/bash /home/${USER}/.safedockerdown/safedockerdown.sh
else 
	exec $command
fi
