/**
 * This Struct is used in 3 exercises (2,3 and 4)
 * */

struct Vector{
    int x;
    int y;
    int z;
    struct Vector* link; // used in exercise 3 (LinkedList)
    double abs; //used in exercise 4 to compare two vectors
};