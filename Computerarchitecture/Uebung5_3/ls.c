#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>

int main(int argc, char *argv[]) {

    DIR *dir;
    struct dirent *dirpointer;

    // check if user has input the directory as an argument
    if (argc != 2) {
        fprintf(stderr, "You have not entered ONE directory\n");
        return EXIT_FAILURE;
    }

    // check if the argument is indeed a directory
    if ((dir = opendir(argv[1])) == NULL) {
        fprintf(stderr, "Error, can not open directory...\n");
    }

    // list all the file inside the directory
    while ((dirpointer = readdir(dir)) != NULL) {
        printf("%s\n", (*dirpointer).d_name);
    }

    if (closedir(dir) == -1) {
        printf("Error while closing %s\n", argv[1]);
    }

    return EXIT_SUCCESS;

}