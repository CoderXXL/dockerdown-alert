#!/bin/bash

echo -n "Are u sure? (yes/No): "
read input
input=${input:-no}

if [ $input == "no" ]; then
	echo "You're welcome"
else
	exec docker-compose down
fi