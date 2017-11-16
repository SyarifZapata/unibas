#include <stdio.h>
#include <memory.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    char ch, source_file[20], target_file[20];
    FILE *source, *target;
    strcpy(source_file, argv[1]);
    strcpy(target_file, argv[2]);
    printf(source_file);
    printf("\n");

    source = fopen(source_file,"r");

    if( source == NULL ) {
        printf("File %s doesnt exist\n", source_file);
        exit(EXIT_FAILURE);
    }

    target = fopen(target_file, "w");

    if( target == NULL )
    {
        fclose(source);
        printf("Something wrong\n");
        exit(EXIT_FAILURE);
    }

    while( ( ch = fgetc(source) ) != EOF )
        fputc(ch, target);

    printf("File copied successfully.\n");

    fclose(source);
    fclose(target);


    return 0;
}