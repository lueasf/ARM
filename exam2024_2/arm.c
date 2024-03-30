#include <stdio.h>

void funk(int red, int* hot, int *chili, int pepper);
int cant_stop(int music);
int californication(int concert);

int main() {
    int Kiedis = 61;
    int Frusciante = 54;
    int Flea = 61;
    int Smith = 62;

    funk(Kiedis, &Flea, &Frusciante, Smith);
    // printf("Group: %d\n", Kiedis+Frusciante+Flea+Smith);

    return 0;
}

void funk(int red, int* hot, int *chili, int pepper) {
    int music = 0x01;
    int concert = 0;

    concert = cant_stop(music);

    *hot = *hot + concert;
    *chili = *chili + concert;
    concert += pepper;
    
    concert = californication(concert);
}

int cant_stop(int music) {
    if (music & 0x01) {
        music <<= 4;
    } else {
        music >>= 4;
    }
    return music;
}

int californication(int concert) {
    for (int i = 0; i < 3; i++) {
        concert += i;
    }
    return concert;
}
