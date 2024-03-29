#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/wait.h>
int main()
{
    int a = 0, b = 1, n = a + b, i, ii;
    pid_t pid;

    printf("Enter the number of a Fibonacci Sequence:\n");
    scanf("%d", &ii);

    if (ii < 0)
        printf("Please enter a non-negative integer!\n");
    else
    {
        pid = fork();
        if (pid == 0)
        {
            printf("Child is producing the Fibonacci Sequence...\n");
            printf("%d %d", a, b);
            for (i = 0; i < ii - 2; i++)
            {
                n = a + b;
                printf(" %d ", n);
                a = b;
                b = n;
            }
            printf("Child ends\n");
        }
        else
        {
            printf("Parent is waiting for child to complete...\n");
            wait(NULL);
            printf("Parent ends\n");
        }
    }
    return 0;
}