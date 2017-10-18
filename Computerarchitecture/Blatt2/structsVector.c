#include <stdio.h>
#include "Vector.h"

struct Vector addVector(struct Vector v1, struct Vector v2);

int main() {

    //Declaration
    struct Vector v1 = {2,1,5};
    struct Vector v2 = {3,8,4};

    struct Vector result = addVector(v1,v2);
    printf("The result vector is: \nx = %d\ny = %d\nz = %d",result.x,result.y, result.z);

    return 0;
}

struct Vector addVector(struct Vector v1, struct Vector v2){
    int x = v1.x + v2.x;
    int y = v1.y + v2.y;
    int z = v1.z + v2.z;
    struct Vector result = {x,y,z};
    return result;
}