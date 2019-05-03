#!/bin/bash

command="docker-compose ${@}"
if [ "${command}" == "docker-compose down" ]; then 
	/bin/bash ./safedockerdown.sh
fi
