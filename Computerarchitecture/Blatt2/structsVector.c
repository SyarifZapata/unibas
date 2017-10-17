#include <stdio.h>
#include "Vector.h"

struct Vector addVector(struct vector3D, struct vector3D);

int main() {

    //Declaration
    struct Vector v1 = {2.3,1.4,5.5};
    struct Vector v2 = {3.3,8.4,4.5};

    struct Vector result = addVector(v1,v2);
    printf("The result vector is \nx = %f\ny = %f\nz = %f",result.x,result.y, result.z);

    return 0;
}

struct Vector addVector(struct Vector v1, struct Vector v2){
    float x = v1.x + v2.x;
    float y = v1.y + v2.y;
    float z = v1.z + v2.z;
    struct Vector result = {x,y,z};
    return result;
}