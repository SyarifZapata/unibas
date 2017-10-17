#include <stdio.h>
#include <stdlib.h>
#include "Vector.h"
#include "VectorList.h"

struct Vector* getElement(struct VectorList* l, int index);
void insertElementFront(struct VectorList* l, struct Vector* v);
void insertElementBack(struct VectorList* l, struct Vector* v);
int size(struct VectorList* l);
void printVector(struct Vector* vector);

int main() {
    struct VectorList* list;
    list = (struct VectorList*)malloc(sizeof(struct VectorList)); // allocated memory space for the list
    list->head = NULL;
    list->tail = NULL;
    list->size = 0;

    struct Vector* vector1 = (struct Vector*)malloc(sizeof(struct Vector));
    struct Vector v1 = {3,5,8};
    *vector1 = v1;

    struct Vector* vector2 = (struct Vector*)malloc(sizeof(struct Vector));
    struct Vector v2 = {15,9,14};
    *vector2 = v2;

    struct Vector* vector3 = (struct Vector*)malloc(sizeof(struct Vector));
    struct Vector v3 = {9,64,1};
    *vector3 = v3;

    insertElementFront(list, vector1);
    insertElementFront(list, vector2);
    insertElementBack(list, vector3);

    struct Vector* result = getElement(list,2);
    printf("Vector found:\n");
    printVector(result);
    int listSize = size(list);
    printf("List size = %d\n",listSize);
    printf("List head: \n");
    printVector(list->head);
    printf("List tail: \n");
    printVector(list->tail);
    return 0;
}

void insertElementFront(struct VectorList* l, struct Vector* v){
    if(l->size == 0){
        l->tail = v;
        l->head = v;
        l->tail->link = NULL;
        l->head->link = NULL;
    } else{
        v->link = l->head;
        l->head = v;
    }
    l->size = l->size+1;
}

void insertElementBack(struct VectorList* l, struct Vector* v){
    if(l->size == 0){
        l->head = v;
        l->tail = v;
        l->tail->link = NULL;
        l->head->link = NULL;
    } else{
        l->tail->link = v;
        l->tail = v;
        l->tail->link = NULL;
    }
    l->size = l->size+1;
}

struct Vector* getElement(struct VectorList* l, int index){
    struct Vector* temp = l->head;
    int i;
    if(index == 0){
        return l->head;
    } else{
        for(i = 0; i < index; i++ ){
            temp = temp->link;
        }
        return temp;
    }
}

int size(struct VectorList* l){
    return l->size;
}

void printVector(struct Vector* vector){
    if (vector == NULL){
        printf("Vector not found\n");
    } else{
        printf("x = %d\n",vector->x);
        printf("y = %d\n",vector->y);
        printf("z = %d\n",vector->z);
    }
}




