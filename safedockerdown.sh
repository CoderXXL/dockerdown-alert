#!/bin/bash
file="/home/${USER}/.safedockerdown/safedockerdown.sh"
maninthemiddle="/home/${USER}/.safedockerdown/maninthemiddle.sh"

if [ ! -f $file ]; then
	echo -n "You did started the script the first time. Do you want me to set it up for you? ? (Yes/no): "
	read input1
	input1=${input1:-yes}

	if [ ${input1^} == "Yes" ]; then
		echo alias docker-compose=\"${maninthemiddle}\" >> /home/${USER}/.zshrc
		mkdir /home/${USER}/.safedockerdown && cp ./maninthemiddle.sh ${maninthemiddle} && cp ./safedockerdown.sh ${file} && rm -rf ../safedockerdown
		echo "Done. You can delete this folder and now simly use 'docker-compose down' and I ll protect you abusing it :) "
		zsh
		exit
	fi
fi

echo -n "Are u sure? (yes/No): "
read input2
input2=${input2:-no}

if [ ${input2^} == "No" ]; then
	echo "You're welcome"
else
	exec docker-compose down
fi
