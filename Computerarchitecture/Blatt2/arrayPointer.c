#include <stdio.h>


int main() {
    int myArray [10];
    int i,j;


    for ( i = 0; i < 10; i++ ) {
        *(myArray + i) = i + 1; /* set element at location i to i+1 */
    }


    int n = sizeof(myArray)/sizeof(myArray[0]);
    printf("%d\n\n",n);

    /* output each array element's value */
    for (j = n; j > 0; j-- ) {
        printf("Element[%d] = %d\n", j, *(myArray+j-1) );
    }

    return 0;
}
