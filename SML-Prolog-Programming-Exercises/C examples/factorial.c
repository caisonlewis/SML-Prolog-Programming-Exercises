#include <stdio.h> 

int fact(int n, int prod) {
	if (n == 0)
		return prod;
	else
		return fact(n-1, prod*n);
}

int factorial(int x) {
	if (x == 0) 
		return 1;
	else return fact(x-1, x);
}

int main(void) {
	printf("Factorial 4 = %i\n", factorial(4));
}
