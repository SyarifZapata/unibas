#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main() {
   __pid_t child_pid;
    child_pid = fork();
    // pid 0 is the child process
    if(child_pid == 0){
        printf("hallo from child");
        exit(0);
    }
    else{
        // immediately sleep. unable to read the exit status of child process
        sleep(3);
        printf("hallo from Parent");
        system("ps -eo pid,ppid,stat,cmd");
    }

    return 0;
}

// a process is a zombie process if it has exited (complete execution) but still has an entry
// in the process table

// in terminal the zombie process is marked as <defunc> and it's status is Z+ means it is a zombie process