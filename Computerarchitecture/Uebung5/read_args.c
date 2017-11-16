#include <stdio.h>
#include <unistd.h>
#include <mem.h>

char* reverse_string(char *str);

int main(int argc, char *argv[]) {
    int c;
    int hflg = 0, tflg = 0;

    while((c= getopt(argc, argv, "ht:")) != -1){
        switch(c){
            case 'h':
                hflg = 1;
                printf("Please type -t <someWord> to see how the given word looks like if written inversely \n");
                break;
            case 't':
                tflg = 1;
                reverse_string(optarg);
                printf(optarg);
                printf("\n");
                break;
            case '?':
                if(optopt == 't'){
                    fprintf(stderr, "Option -%c needs argument\n", optopt);
                }else{
                    fprintf(stderr, "Unknown option -%c. \n", optopt);
                }

                break;

            default:
                fprintf(stderr, "getopt");
        }
    }

    printf("hflg = %d, tflg = %d\n", hflg, tflg );
    return 0;
}

char* reverse_string(char *str) {
    char temp;
    size_t len = strlen(str) - 1;
    size_t i;
    size_t k = len;

    for(i = 0; i < len; i++)
    {
        temp = str[k];
        str[k] = str[i];
        str[i] = temp;
        k--;

        /* As 2 characters are changing place for each cycle of the loop
           only traverse half the array of characters */
        if(k == (len / 2))
        {
            break;
        }
    }
}