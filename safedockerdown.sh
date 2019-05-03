#!/bin/bash
file="/home/${USER}/.safedockerdown/safedockerdown.sh"
maninthemiddle="/home/${USER}/.safedockerdown/maninthemiddle.sh"
uninstall=/home/${USER}/.safedockerdown/uninstall.sh

if [ ! -f $file ]; then
	echo -n "You did started the script the first time. Do you want me to set it up for you? ? (Yes/no): "
	read firstStart
	firstStart=${firstStart:-yes}
	firstStartlettercheck=${firstStart:0:1}

	if [ ${firstStartlettercheck^} == "Y" ]; then
		echo -n "Are u using zsh? (Yes/no): "
		read zshrc
		zshrc=${zshrc:-yes}
		zshrclettercheck=${firstStart:0:1}
		if [ ${zshrclettercheck^} ==  'Y' ]; then
			echo alias docker-compose=\"${maninthemiddle}\" >> /home/${USER}/.zshrc
		else
			echo alias docker-compose=\"${maninthemiddle}\" >> /home/${USER}/.bashrc
		fi

		mkdir /home/${USER}/.safedockerdown && cp ./maninthemiddle.sh ${maninthemiddle} && cp ./safedockerdown.sh ${file} && cp ./uninstall.sh ${uninstall} && rm -rf ../safedockerdown
		echo "Done. Now simply use 'docker-compose down' and I ll protect you abusing it :) "
		zsh
		exit
	fi
	exit
fi

echo -n "Are u sure? (yes/No): "
read input2
input2=${input2:-null}


if [ ${input2^} == "No" ]; then
	echo "You're welcome"
	exit
fi

if [ ${input2^} == "Y" ]; then
	echo "Write out \"yes\""
	exit
fi

if [ ${input2^} == "Yes" ]; then
	exec docker-compose down
else
	echo "Abort."
fi
