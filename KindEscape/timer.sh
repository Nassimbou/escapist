#!/bin/bash
 hour=0
 min=0
 sec=0

echo "while nice /bin/sleep 1;do nice /usr/bin/tput sc;nice /usr/bin/tput cup 0 \$((\$(/usr/bin/tput cols)-11));nice /usr/bin/ps -o etime= -p \"\$\$\";nice /usr/bin/tput rc;done &" >> /home/KindEscape/.bashrc
. /home/KindEscape/.bashrc
source /home/KindEscape/.bashrc

        while [ $hour -le 59 ]; do
                 while [ $min -le 59 ]; do
			if [ $min -eq 1 ]
			then
				echo "Regarde les binaires disponibles dans le dossier home/bin" > /home/KindEscape/indice1.txt
			fi
			if [ $min -eq 2 ]
			then
				echo "nice permet de changer et modifier la priorité des processus, ou d'en exécuter avec certaines priorités" > /home/KindEscape/indice2.txt
			fi
			if [ $min -eq 4 ]
			then
				echo "nice [PATH_TO_PROCESS]" > /home/KindEscape/indice3.txt
			fi
                         while [ $sec -le 59 ]; do

                                 let "sec=sec+1"
                                 sleep 1

                         done
                         sec=0
                         let "min=min+1"
                 done
                 min=0
                 let "hour=hour+1"
         done
