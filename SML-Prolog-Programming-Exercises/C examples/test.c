/*
 * gcc -S test.c - produces assembly code in test.s
 * as test.s -o test.o - assembles test.s into test.o object code
 * gcc -c test.s -o test.o - does the same thing
*/
#include <stdio.h>
int i;
int fred(int);

int main() {
  printf("Running program test..\n");
  for (i=1; i <= 100; i++) 
     fred(i);
}  
