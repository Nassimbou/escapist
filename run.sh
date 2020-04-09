#!/bin/bash

re='^[0-9]+$'

clear
echo "
		 _____                            _   _                _          _ _ 
		| ____|___  ___ __ _ _ __   ___  | |_| |__   ___   ___| |__   ___| | |
------		|  _| / __|/ __/ _\` | '_ \ / _ \ | __| '_ \ / _ \ / __| '_ \ / _ \ | |		------
		| |___\__ \ (_| (_| | |_) |  __/ | |_| | | |  __/ \__ \ | | |  __/ | |
		|_____|___/\___\__,_| .__/ \___|  \__|_| |_|\___| |___/_| |_|\___|_|_|

"
echo $'\n'

echo $'L\'objectif de ces challenges est de réussir à exécuter le fichier binaire bin/escape.' 
echo $'Pour cela tu seras placé dans un environnement restreint, avec seulement certains
fichiers binaires exécutable à ta disposition. Bonne chance !' 

echo $'\n'
echo $'\n'

echo $'Challenges disponibles :'

echo $'\n'
echo $'\t       Nom      \t Difficulté'
echo $'\t[1] KindEscape\t\t[-         ]'
echo $'\t[2] PrivEscape\t\t[--        ]'
echo $'\t[3] ProgEscape\t\t[--        ]'
echo $'\t[4] IDEscape\t\t[---       ]'
echo $'\t[5] FindEscape\t\t[          ]'

echo $'\n'
echo $'Quel est le numéro du challenge auquel tu veux jouer ?'

read var

while ! [[ $var =~ $re ]]; 
do
	echo 'Pas un nombre';
	read var
done

while [ "$var" -le 0 ] || [ "$var" -ge 5 ];
do
	echo 'Saisie incorrect, ressaisir'	
	read var
	while ! [[ $var =~ $re ]]; 
	do
		echo 'Pas un nombre';
		read var
	done
done
echo '[+] Chargement en cours'
Challenges/Challenge${var}.sh
