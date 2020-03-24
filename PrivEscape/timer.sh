#!/bin/bash
 hour=0
 min=0
 sec=0


        while [ $hour -le 59 ]; do
                 while [ $min -le 59 ]; do
			if [ $min -eq 2 ]
			then
				/bin/walle "le fichier escape a besoin d'être exécuté en mode privilégié"
			fi
			if [ $min -eq 4 ]
			then
				/bin/walle "sudo -l pour savoir ce qu'on peut exécuter en mode privilégié"
			fi
			if [ $min -eq 8 ]
			then
				/bin/walle "éditer le fichier /etc/sudoers en mode privilégié pour se donner tout les droits"
			fi
                         while [ $sec -le  59 ]; do
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

