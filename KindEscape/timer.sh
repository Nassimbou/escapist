#!/bin/bash
 hour=0
 min=0
 sec=0

        while [ $hour -ge 0 ]; do
                 while [ $min -ge 0 ]; do
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
                   			/bin/walle "Wow c'est lose"
                   			sed -i '$ d' /home/KindEscape/.bashrc
                  			sed -i '$ d' /home/KindEscape/.bashrc
                  			. /home/KindEscape/.bashrc
          				exit 0
          			 fi

                         done
                         sec=0
                         let "min=min+1"
                 done
                 min=0
                 let "hour=hour+1"
         done

