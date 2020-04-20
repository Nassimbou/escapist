#include <stdio.h>
#include <curl/curl.h>
#include <string.h>
 
int main(void)
{
  CURL *curl;
  CURLcode res; 
  char nom[85];
  char str[80];

    FILE *fp;
  char path[1035];

  fp = popen("/usr/bin/hostname", "r");
  if (fp == NULL) {
    printf("Failed to run command\n" );
    return 0;
  }

  while (fgets(path, sizeof(path), fp) != NULL) {
    continue;
  }

  pclose(fp);

  curl_global_init(CURL_GLOBAL_ALL);
 
  curl = curl_easy_init();

  printf("Bravo tu as gagné, saisis ton nom pour sauvegarder ton temps");
	scanf("%s",nom);

  
  strcpy(str, "FIN&");
  strcat(str, path);
  strcat(str, "&");
  strcat(str, nom);

  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, "api:8080");
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, str);
 
    res = curl_easy_perform(curl);
    if(res != CURLE_OK)
      fprintf(stderr, "curl_easy_perform() failed: %s\n",
              curl_easy_strerror(res));

    curl_easy_cleanup(curl);
  }
  curl_global_cleanup();
  return 0;
}