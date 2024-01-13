#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>

void copyFile(const char *file1, const char *file2)
{
    FILE *source, *target;
    char ch;

    source = fopen(file1, "r");
    if (source == NULL)
    {
        perror("Error opening source file");
        exit(EXIT_FAILURE);
    }

    target = fopen(file2, "w");
    if (target == NULL)
    {
        fclose(source);
        perror("Error opening target file");
        exit(EXIT_FAILURE);
    }

    while ((ch = fgetc(source)) != EOF)
    {
        fputc(ch, target);
    }

    fclose(source);
    fclose(target);
}

void displayFile(const char *filename)
{
    FILE *file;
    char ch;

    file = fopen(filename, "r");
    if (file == NULL)
    {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    printf("Content of %s:\n", filename);
    while ((ch = fgetc(file)) != EOF)
    {
        putchar(ch);
    }
    putchar('\n');
    fclose(file);
}

int compare(const void *a, const void *b)
{
    return (*(char *)b - *(char *)a);
}

void displaySortedReverse(const char *filename)
{
    FILE *file;
    char ch, content[1000];
    int i = 0;

    file = fopen(filename, "r");
    if (file == NULL)
    {
        perror("Error opening file");
        exit(EXIT_FAILURE);
    }

    while ((ch = fgetc(file)) != EOF)
    {
        content[i++] = ch;
    }
    content[i] = '\0';

    qsort(content, i, sizeof(char), compare);

    printf("Sorted content of %s in reverse order:\n", filename);
    for (i = 0; i < strlen(content); i++)
    {
        putchar(content[i]);
        putchar('\n');
    }

    fclose(file);
}

int main()
{
    pid_t pid1, pid2, pid3;

    printf("Parent process ID: %d\n", getpid());

    pid1 = fork();
    if (pid1 == 0)
    {
        printf("First child process ID: %d, Parent ID: %d - Copying file1 to file2\n", getpid(), getppid());
        copyFile("file1.txt", "file2.txt");
        exit(EXIT_SUCCESS);
    }
    else if (pid1 < 0)
    {
        perror("Error in first fork");
        exit(EXIT_FAILURE);
    }
    else
    {
        sleep(1);
        pid2 = fork();
        if (pid2 == 0)
        {
            printf("Second child process ID: %d, Parent ID: %d - Displaying file2 content\n", getpid(), getppid());
            displayFile("file2.txt");
            exit(EXIT_SUCCESS);
        }
        else if (pid2 < 0)
        {
            perror("Error in second fork");
            exit(EXIT_FAILURE);
        }
        else
        {
            sleep(1);
            pid3 = fork();
            if (pid3 == 0)
            {
                printf("Third child process ID: %d, Parent ID: %d - Displaying sorted reverse content of file2\n", getpid(), getppid());
                displaySortedReverse("file2.txt");
                exit(EXIT_SUCCESS);
            }
            else if (pid3 < 0)
            {
                perror("Error in third fork");
                exit(EXIT_FAILURE);
            }
            else
            {
                sleep(1);
                printf("All child processes completed.\n");
                wait(NULL);
                wait(NULL);
                wait(NULL);
            }
        }
    }

    return 0;
}