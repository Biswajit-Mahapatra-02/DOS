#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
int main()
{
    pid_t pid = fork();
    if (pid == 0)
    {
        printf("Child process pid: %d\n", pid);
        fflush(stdout);
        while (1)
            ;
    }
    else
    {
        printf("Parent process pid: %d\n", pid);
        fflush(stdout);
        while (1)
            ;
    }
    return 0;
}