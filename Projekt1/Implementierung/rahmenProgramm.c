#include <stdio.h>

// Dem Compiler mitteilen, dass sich die Funktion "floatSin" in einer anderen Datei befindet.

extern float _floatSin(float x) asm("_floatSin");

int main() {
    float x;    // Eingabewert
	int test;
    printf("\n");
    printf("--------------------------------------------------------\n");
    printf("Enter the float-value you wish to calculate the sine of:\n");
    printf("--------------------------------------------------------\n");
    test = scanf("%f", &x);
	if (test != 1) {
		printf("You can only enter a number!");
	} else {
		printf("\nsin(%f) = ", x);
		printf("%f\n", _floatSin(x));
	}
    printf("\n-------------------------DONE------------------------\n");
}
