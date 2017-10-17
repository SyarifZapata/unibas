#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "Vector.h"

double getAbsolutValue(struct Vector vector);
void printArray(struct Vector vector[], int size);
struct Vector* sortArray(struct Vector vector[], int size);
int compareFunc(const void *a, const void *b);


int main() {

    struct Vector vector[12];
    struct Vector v1 = {2,1,5};
    struct Vector v2 = {9,15,33};
    struct Vector v3= {7,9,56};
    struct Vector v4= {3,8,12};
    struct Vector v5= {13,0,34};
    struct Vector v6 = {14,8,4};
    struct Vector v7= {20,87,4};
    struct Vector v8= {9,8,1};
    struct Vector v9= {40,11,22};
    struct Vector v10= {16,24,4};
    struct Vector v11= {36,3,12};
    struct Vector v12= {77,56,10};
    vector[0] = v1;
    vector[1] = v2;
    vector[2] = v3;
    vector[3] = v4;
    vector[4] = v5;
    vector[5] = v6;
    vector[6] = v7;
    vector[7] = v8;
    vector[8] = v9;
    vector[9] = v10;
    vector[10] = v11;
    vector[11] = v12;
    int i;
    for(i=0;i<12;i++){
        vector[i].abs = getAbsolutValue(vector[i]);
    }

    int size = sizeof(vector)/ sizeof(vector[0]);
    printArray(vector, size);
    struct Vector* p;
    p = sortArray(vector,size);
    printf("%d\n", p);
    printf("%f\n", *p);

//    for(i =0; i<size; i++){
//        printf("%f\n", *p);
//    }


    return 0;
}

double getAbsolutValue(struct Vector vector){
    double result = sqrt((vector.x*vector.x) + (vector.y*vector.y) + (vector.z*vector.z));
    return result;
}

void printArray(struct Vector vector[], int size){

    int i;
    for(i=0 ; i<size; i++){
        int x = vector[i].x;
        int y = vector[i].y;
        int z = vector[i].z;
        printf("(%d, %d, %d)\n",x,y,z);
    }
}

int compareFunc(const void *a, const void *b){

   struct Vector* aa = (struct Vector *)a;
    struct Vector* bb = (struct Vector *)b;

    return (int)(aa->abs - bb->abs);
}

struct Vector* sortArray(struct Vector vector[], int size){
    printf("\n\n");
    qsort(vector, size, sizeof(struct Vector), compareFunc);
    int i;
    for(i =0; i<size; i++){
        printf("%f\n", vector[i].abs);
    }
//    printArray(vector, size);
    struct Vector* p = vector;
    return p;
}
