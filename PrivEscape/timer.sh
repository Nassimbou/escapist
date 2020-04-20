#!/bin/bash
 hour=0
 min=0
 sec=0

echo "while nice /bin/sleep 1;do nice /usr/bin/tput sc;nice /usr/bin/tput cup 0 \$((\$(/usr/bin/tput cols)-11));nice /usr/bin/ps -o etime= -p \"\$\$\";nice /usr/bin/tput rc;done &" >> /home/PrivEscape/.bashrc
source /home/PrivEscape/.bashrc

        while [ $hour -le 59 ]; do
                 while [ $min -le 59 ]; do
			if [ $min -eq 1 ]
			then
				echo "le fichier escape a besoin d'être exécuté en mode privilégié" > /home/PrivEscape/indice1.txt
			fi
			if [ $min -eq 2 ]
			then
				echo "sudo -l pour savoir ce qu'on peut exécuter en mode privilégié" > /home/PrivEscape/indice2.txt
			fi
			if [ $min -eq 4 ]
			then
				echo "éditer le fichier /etc/sudoers en mode privilégié pour se donner tout les droits" > /home/PrivEscape/indice3.txt
			fi
                         while [ $sec -le  59 ]; do
                                 #echo -ne "$hour:$min:$sec\033[0K\r"
                                 let "sec=sec+1"
                                 sleep 1

                         done
                         sec=0
                         let "min=min+1"
                 done
                 min=0
                 let "hour=hour+1"
         done

