#include <stdio.h>

int split(int a, int b);
void func1(int *a, int b);
void func2(int a, int *b);
int result(int a, int b);

int main() {
    int a = 10;
    int b = 3;
    int c = 0;

    c = split(a, b);
    // printf("count: %d\n", c);
    return 0;
}

int split(int a, int b) {
    int count = 0;

    int c = 0;
    c = result(a, b);

    while (c != 0) {
        count++;
        if (c > 0) {
            func1(&a, b);
        } else {
            func2(a, &b);
        }
        c = result(a, b);
    }
    return count;
}

void func1(int *a, int b) {
    *a = *a - b;
}

void func2(int a, int *b) {
    *b = *b - a;
}

int result(int a, int b) {
    return a - b;
}
