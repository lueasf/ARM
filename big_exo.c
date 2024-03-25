#include <stdio.h>

int phoenix(int a, int b);
int objection(int i);
void miles(int counter);

int phoenix(int a, int b) {
    int clue = a;
    clue -= b;
    if (clue > 0) {
        phoenix(clue, b);
    }
    return objection(a);
}

int objection(int i) {
    int rapport = 0;
    rapport *= i;
    miles(rapport);
    return rapport;
}

void miles(int counter) {
    if (counter > 0) {
        //printf("coupable !\n");
        return;
    }
    //printf("non coupable !\n");
}

int main() {
    int allClues = 10;
    int temoignage = 1;
    phoenix(allClues, temoignage);
}