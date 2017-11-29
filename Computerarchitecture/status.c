#include <stdio.h>
#include <sys/stat.h>
#include <mem.h>
#include <time.h>


int main(int argc, char *argv[]) {
    char mtime[100], source_file[20]; // variable to store the time and the sourcefile

    strcpy(source_file, argv[1]);

    // using stat function we take the information of a file
    struct stat buf;
    stat(source_file, &buf);

    // status in octal
    printf("st_mod = %o\n", buf.st_mode);
    printf("ownerId = %d\n", buf.st_uid);

    printf("file length = %d\n", buf.st_size);
    strcpy(mtime, ctime(&buf.st_mtime));
    printf("st_mtime = %s\n", mtime);


    // print file permission as a char
    printf("File Permissions: \t");
    printf( (S_ISDIR(buf.st_mode)) ? "d" : "-");
    printf( (buf.st_mode & S_IRUSR) ? "r" : "-");
    printf( (buf.st_mode & S_IWUSR) ? "w" : "-");
    printf( (buf.st_mode & S_IXUSR) ? "x" : "-");
    printf("\n\n");


    return 0;
}