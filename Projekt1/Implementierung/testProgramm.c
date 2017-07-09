#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

// Dem Compiler mitteilen, dass sich die Funktion "floatSin" in einer anderen Datei befindet.

extern float _floatSin(float x) asm("_floatSin");

float numbers[10] = {0.512342, 1.731423, 3.644133, 12.424120, 10.337920, 54.426100,
                    512.124138, 67.183918, 41.231801, 4893.413728}; 

int main() {
    srand(time(NULL));

    printf("----------------------------------------------------\n");
    printf("Proceeding with testing. First we will test accuracy.\n");
    printf("-----------------------------------------------------\n\n");

    for (int i = 0; i < 10; ++i)
    {
        printf("Input: %f\n", numbers[i]);
        printf("Official C-Function: %f\n", sinf(numbers[i]));
        printf("Our ASM-Function: %f\n", _floatSin(numbers[i]));
        printf("Deviation: %f\n", (sinf(numbers[i]) - _floatSin(numbers[i])));
        printf("\n");
    }

    printf("--------------------------------------------------\n\n");

    printf("------------------------------------------------\n");
    printf("Proceeding with testing. Now we will test speed.\n");
    printf("------------------------------------------------\n\n\n");
    for (int i = 0; i < 10; ++i)
    {
        float cSin;
        float asmSin;
        double cTime;
        double asmTime;

        clock_t begin = clock();
        cSin = sinf(numbers[i]);
        clock_t end = clock();
        cTime = (double)(end - begin) / CLOCKS_PER_SEC;

        begin = clock();
        asmSin = sinf(numbers[i]);
        end = clock();
        asmTime = (double)(end - begin) / CLOCKS_PER_SEC;

        printf("Input: %f\n", numbers[i]);
        printf("Official C-Function: %lf\n", cTime);
        printf("Our ASM-Function: %lf\n", asmTime);
        printf("Deviation: %lf\n", (cTime - asmTime));
        printf("\n");
    }

    printf("--------------------------------------------------\n");

}

