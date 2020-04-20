#include <stdio.h>
#include <curl/curl.h>
 
int main(void)
{
  CURL *curl;
  CURLcode res;
  
  FILE *fp;
  char path[1035];

  fp = popen("hostname", "r");
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
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, "api:8080");
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, path);
 
    res = curl_easy_perform(curl);
    if(res != CURLE_OK)
      fprintf(stderr, "curl_easy_perform() failed: %s\n",
              curl_easy_strerror(res));

    curl_easy_cleanup(curl);
  }
  curl_global_cleanup();
  return 0;
}