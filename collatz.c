
#include <stdio.h>
#include <stdlib.h>
extern unsigned long collatz2(unsigned long, unsigned long);

int collatz(int num, int* answer) {
	if (num == 1) {
		return *answer;
	} else if (num % 2 == 0) {
		(*answer)++;
		collatz(num/2, answer);
	}else {
		(*answer)++;
		collatz(3*num + 1, answer);
	}
}

int main(int argc, char **argv) {
	int num = atoi(argv[1]);
	int answer = 0;
	unsigned long answer2 = 0;
	collatz(num, &answer);
	collatz2((unsigned long) num, (unsigned long) &answer2);
	printf("%d steps - c collatz\n", answer);
	printf("%lu steps - assembly collatz\n", answer2);
	return 0;

}	
