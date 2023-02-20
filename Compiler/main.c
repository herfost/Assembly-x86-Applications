#include <stdlib.h>
#include <stdio.h>

int main()
{
	int i;
	for (i = 0; i < 255; ++i) {} 
	
	i = 0;
	while (i < 255) { ++i; }
	
	i = 0;
	do { ++i; } while (i < 255);
	
 	return 0;
}