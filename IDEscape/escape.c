#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {

	char nom[25];
	char command [25];	
		
	//printf("Bravo tu as gagné, saisis ton nom pour sauvegarder ton temps");
	scanf("%s",nom);
	snprintf(command, sizeof(command), "echo %s >> nom", nom); 	
	
	system("nice /bin/touch nom");
	system(command);
	system("nice /bin/sleep 2");
	return 0;

}

