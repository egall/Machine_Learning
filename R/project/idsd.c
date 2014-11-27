/* Author: Erik Steggall
   Code based on the work from W. Richard Stevens
   Most of this code is directly from the daemonize()
   written in chapter 13 of his book Advanced Unix Programming
*/
#include <fcntl.h>              /* define open and such */
#include <sys/resource.h>       /* systems resources */
#include <signal.h>		/* for SIG_ERR */
#include <syslog.h>             /* for logging error */
#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>             /* for va_start and va_end */

#define MAXLINE 4096


/*
 * Print a message and return to caller.
 * Caller specifies "errnoflag".
 */
static void
err_doit(int errnoflag, int error, const char *fmt, va_list ap)
{
        char    buf[MAXLINE];

        vsnprintf(buf, MAXLINE-1, fmt, ap);
        if (errnoflag)
                snprintf(buf+strlen(buf), MAXLINE-strlen(buf)-1, ": %s",
                  strerror(error));
        strcat(buf, "\n");
        fflush(stdout);         /* in case stdout and stderr are the same */
        fputs(buf, stderr);
        fflush(NULL);           /* flushes all stdio output streams */
}

/*
 * Fatal error unrelated to a system call.
 * Print a message and terminate.
 */
void
err_quit(const char *fmt, ...)
{
        va_list         ap;

        va_start(ap, fmt);
        err_doit(0, 0, fmt, ap);
        va_end(ap);
        exit(1);
}

void 
daemonize(const char *cmd) 
{ 
  int i, fd0, fd1, fd2, itor; 
  pid_t pid; 
  struct rlimit rl; 
  struct sigaction sa; 
  
  printf("starting daemon\n");
  /* 
  * Clear file creation mask. 
  */ 
  umask(0); 
  /* 
  * Get maximum number of file descriptors. 
  */ 
  if (getrlimit(RLIMIT_NOFILE, &rl) < 0){
    err_quit("%s: can't get file limit", cmd); 
  }
  /* 
  * Become a session leader to lose controlling TTY. 
  */ 
  if ((pid = fork()) < 0){
    err_quit("%s: can't fork", cmd); 
  }
  else if (pid != 0){ /* parent */
    exit(0); 
  }
  setsid(); 
  /* 
  * Ensure future opens won't allocate controlling TTYs. 
  */ 
  sa.sa_handler = SIG_IGN; 
  sigemptyset(&sa.sa_mask); 
  sa.sa_flags = 0; 
  if (sigaction(SIGHUP, &sa, NULL) < 0){
    err_quit("%s: can't ignore SIGHUP"); 
  }
  if ((pid = fork()) < 0){
    err_quit("%s: can't fork", cmd); 
  }
  else if (pid != 0){ // parent / 
    exit(0); 
  }
  /* 
  * Change the current working directory to the root so 
  * we won't prevent file systems from being unmounted. 
  */ 
  if (chdir("/") < 0) 
    err_quit("%s: can't change directory to /"); 
  /* 
  * Close all open file descriptors. 
  */ 
  if (rl.rlim_max == RLIM_INFINITY){
    rl.rlim_max = 1024; 
  }
  for (i = 0; i < rl.rlim_max; i++){
    close(i); 
  }
  /* 
  * Attach file descriptors 0, 1, and 2 to /dev/null. 
  */ 
  fd0 = open("/dev/null", O_RDWR); 
  fd1 = dup(0); 
  fd2 = dup(0); 
  /* 
  * Initialize the log file. 
  */ 
  openlog(cmd, LOG_CONS, LOG_DAEMON); 
  if (fd0 != 0 || fd1 != 1 || fd2 != 2){ 
    syslog(LOG_ERR, "unexpected file descriptors %d %d %d",
    fd0, fd1, fd2); 
    exit(1); 
  } 
  //system("Rscript /home/egall/projects/Machine_Learning/R/project/simpr.R");
  for(itor = 0; itor < 10; itor++){
    system("Rscript /home/egall/projects/Machine_Learning/R/project/simpr.R");
    sleep(5);
  }
/*
  FILE* idslog_fp;
  idslog_fp = fopen("/home/egall/projects/Machine_Learning/R/project/idslog.log", "w+");
  for(itor = 0; itor < 10; itor++){
    fprintf(idslog_fp, "this is a test\n");
  }
  fclose(idslog_fp);
*/
} 

int main(int argc, char* argv[]){
  daemonize("idsd");
  return 0;
}
