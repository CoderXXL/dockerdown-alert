#!/bin/bash
file="/home/${USER}/.safedockerdown/safedockerdown.sh"
maninthemiddle="/home/${USER}/.safedockerdown/maninthemiddle.sh"

echo -n "U realy want to uninstall safedockerdown? (yes/No): "
read uninstall
uninstall=${uninstall:-no}
uninstalllettercheck=${uninstall:0:1}

if [ ${uninstalllettercheck^} == "N" ]; then
	echo "Exit."
fi

if [ ${uninstall^} == "Yes" ] || [ ${uninstalllettercheck^} == "Y" ]; then
	cat /home/${USER}/.zshrc > /home/${USER}/tempzshrc.txt
	sed '/safedockerdown/d' /home/${USER}/tempzshrc.txt > /home/${USER}/.zshrc
	cat /home/${USER}/.bashhrc > /home/${USER}/tempbashrc.txt
	sed '/safedockerdown/d' /home/${USER}/tempbashrc.txt > /home/${USER}/.bashrc
	rm -rf /home/${USER}/.safedockerdown
	exit
fi

