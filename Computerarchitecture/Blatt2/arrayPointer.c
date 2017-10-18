#include <stdio.h>


int main() {
    int *myArray [10];
    int i,j;


    for ( i = 0; i < 10; i++ ) {
        // an Asterisk is a pointer operator. *myArray will return the value holds in the base address of the array.
        *(myArray + i) = i + 1;
    }


    int n = sizeof(myArray)/sizeof(myArray[0]);
    printf("%d\n\n",n);

    /* output each array element's value */
    for (j = n; j > 0; j-- ) {
        printf("Element[%d] = %d\n", j, *(myArray+j-1) );
    }

    return 0;
}
