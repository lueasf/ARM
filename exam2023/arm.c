int hannah(int h);
void transform(int* someone, int accessory);
int sing(int singer, int song, int tonality);


int main() {
    int harmony = 2;
    int concert = 0;

    concert = hannah(harmony);

    return concert;
}

int hannah(int h) {
    int miley = 0;    
    int wig = 4;

    int wreckingball = 20;
    int flowers = 30;
    int music = 0;

    transform(&miley, wig);

    music = sing(miley, wreckingball, h);
    music += sing(miley, flowers, h);

    return music;
}

void transform(int* someone, int accessory) {
    int a = accessory;

    if (a == 0) {
        return;
    }
    a = a >> 1;
    *someone = *someone + a;
    transform(someone, a);
}

int sing(int singer, int song, int tonality) {
    int notes = 0;

    notes = song + singer;
    notes = notes << tonality;

    return notes;
}