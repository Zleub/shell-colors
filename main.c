#include <stdio.h>
#include "colors.h"

int main(void) {
	int i = 0;

	while (colorsDef[i] != NULL) {
		printf("%s ", colorsDef[i](colorsList[i]));
		i += 1;
	}
	return (0);
}
