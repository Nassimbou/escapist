#!/bin/bash
 hour=0
 min=0
 sec=0

echo "while nice /bin/sleep 1;do nice /usr/bin/tput sc;nice /usr/bin/tput cup 0 \$((\$(/usr/bin/tput cols)-11));nice /usr/bin/ps -o etime= -p \"\$\$\";nice /usr/bin/tput rc;done &" >> /home/KindEscape/.bashrc
. /home/KindEscape/.bashrc

        while [ $hour -le 59 ]; do
                 while [ $min -le 59 ]; do
			if [ $min -eq 1 ]
			then
				/bin/walle "Regarde les binaires disponibles dans le dossier home/bin"
			fi
			if [ $min -eq 2 ]
			then
				/bin/walle "nice permet de changer et modifier la priorité des processus, ou d'en exécuter avec certaines priorités"
			fi
			if [ $min -eq 3 ]
			then
				/bin/walle "nice [PATH_TO_PROCESS]"
			fi
                         while [ $sec -le 59 ]; do
                                 #echo -ne "$hour:$min:$sec\033[0K\r"
                                 let "sec=sec+1"
                                 sleep 1
				 #if [ $sec -eq 8 ]
				 #then
			 	#	/bin/walle "test"
			       	# fi
				 
				 dupe_script=$(ps -ef | grep $1 | grep -v "grep" | grep -v "timer" | wc -l)
   
			         if [ ${dupe_script} -ge 1 ]; then
                   			/bin/walle $"Bravo, tu as réussi à t'échapper du shell en ${min} minutes et ${sec} secondes. Pour cele il a fallut exécuter la commande nice avec le chemin vers le fichier escape : nice bin/escape \nQuel est ton nom ?"
					while [ ! -f /home/KindEscape/nom ]; do sleep 0.25; done
					nom=$( cat /home/KindEscape/nom )
					echo "$nom : $min:$sec" >> /pwd/Results/KindEscape
                   			# sed -i '$ d' /home/KindEscape/.bashrc
                  			# sed -i '$ d' /home/KindEscape/.bashrc
                  			#. /home/KindEscape/.bashrc
					ps -ef | grep 'bash' | grep -v grep | awk '{print $2}' | xargs -r kill -9
	          				
					exit 0
          			 fi

                         done
                         sec=0
                         let "min=min+1"
                 done
                 min=0
                 let "hour=hour+1"
         done
