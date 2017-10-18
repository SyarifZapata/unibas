#include <stdio.h>

int main() {
    // create an array for 10 integers value
    int myArray [10];
    int i,j;

    for ( i = 0; i < 10; i++ ) {
        // array's index starts with 0, therefore we add 1 to i as the value
        myArray[i] = i + 1;
    }

    // There is no built in function to find out array's length. here n is the the array size.
    int n = sizeof(myArray)/sizeof(myArray[0]);
    printf("%d\n\n",n); // print out to confirm

    // output arrays' elements from to highest to the lowest value.
    for (j = n; j > 0; j-- ) {
        printf("Element[%d] = %d\n", j, myArray[j-1] );
    }

    return 0;


}