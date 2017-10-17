#include <stdio.h>
#include <stdlib.h>
#include "Vector.h"

// Using malloc calloc realloc and free
int main() {
    int a; // local variable goes to stack

    int *vector;

    vector = (int*)malloc(20*sizeof(int)); // if malloc can not find any space, it will return 0
    *vector = 10; // equivalent to vector[0]
    *(vector+1) = 20;
    vector[2]= 50;
    printf("%d",vector[0]);
    free(vector); // we clear the memory here
//    vector = (int*)malloc(sizeof(int));
//    *vector = 20;
    return 0;
}
