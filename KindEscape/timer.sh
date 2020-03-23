#!/bin/bash
 hour=0
 min=0
 sec=0

echo "while nice /bin/sleep 1;do nice /usr/bin/tput sc;nice /usr/bin/tput cup 0 \$((\$(tput cols)-11));nice /bin/awk '{printf(\"%02d:%02d:%02d\",int(\$1/3600),int(\$1/3600/60),int(\$1%60))}' /proc/uptime;nice /usr/bin/tput rc;done &" >> /home/KindEscape/.bashrc
        while [ $hour -ge 0 ]; do
                 while [ $min -ge 0 ]; do
			if [ $min -eq 2 ]
			then
				/bin/walle "Regarde les binaires disponibles dans le dossier home/bin"
			fi
			if [ $min -eq 4 ]
			then
				/bin/walle "nice permet de changer et modifier la priorité des processus, ou d'en exécuter avec certaines priorités"
			fi
			if [ $min -eq 8 ]
			then
				/bin/walle "nice [PATH_TO_PROCESS]"
			fi
                         while [ $sec -ge 0 ]; do
                                 #echo -ne "$hour:$min:$sec\033[0K\r"
                                 let "sec=sec+1"
                                 sleep 1
				 #if [ $sec -eq 8 ]
				 #then
				#	/bin/walle "test"
				# fi
				 
				 dupe_script=$(ps -ef | grep $1 | grep -v "grep" | grep -v "timer" | wc -l)
   
			         if [ ${dupe_script} -ge 1 ]; then
                   			/bin/walle $"Bravo, tu as réussi à t'échapper du shell en ${min} minutes et ${sec} secondes \nQuel est ton nom ?"
					while [ ! -f /home/KindEscape/nom ]; do sleep 0.25; done
					nom=$( cat /home/KindEscape/nom )
					echo "$nom : $min:$sec" >> /pwd/Results/results
                   			# sed -i '$ d' /home/KindEscape/.bashrc
                  			# sed -i '$ d' /home/KindEscape/.bashrc
                  			#. /home/KindEscape/.bashrc
	          				
					exit 0
          			 fi

                         done
                         sec=0
                         let "min=min+1"
                 done
                 min=0
                 let "hour=hour+1"
         done

