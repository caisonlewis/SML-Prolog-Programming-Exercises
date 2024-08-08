/*
 * gcc -S loop_invariant.c - no optimization performed
 * gcc -O -S loop_invariant.c - optimizations performed
*/
#include <stdio.h>
int main() {

    int i = 0;
    int x[100];
    int y = 10;

    while (i < 100) {
	    x[i] = y*y*y;
	    i += 1;
    }

    for(i=0; i < 100; i++)
    	    printf("%d\n", x[i]);
	
}
