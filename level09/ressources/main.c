#include<unistd.h>
#include<stdio.h>

int main(int argc, char **argv)
{
	if (argc != 2)
	{
		printf("Need only 1 arg\n");
		return (0);
	}
	int i = 0;
	while(argv[1][i])
	{
		char c = argv[1][i];
		putchar(c - i);
		i++;
	}
	putchar('\n');
	return (0);
}