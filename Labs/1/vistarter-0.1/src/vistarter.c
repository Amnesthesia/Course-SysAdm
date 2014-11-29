#include <unistd.h>   /* fork, exec */
#include <stdio.h>    /* printf */
#include <sys/wait.h> /* wait */

int main(int argc, char *argv[]) 
{
  int p;

  p=fork();
  if (p==0) { 			/* sjekk om vi er i child */
    printf("\n\n... child will start vi\n\n");
    /* NB, STYGG KODE, INGEN INPUTSJEKKING */
    execv("/usr/bin/vi",argv); 	/* child */
  }
  printf("\n\n... Parent: Waiting for child process to complete\n\n"); 
  while(wait(NULL)>0) { /*no-op*/ ; }
  printf("\n\n...Parent:..child process completed.\n");

  return 0;
}
