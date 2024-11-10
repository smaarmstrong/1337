// hello world program

/*
compile and run:
gcc -o hello 2.2hello.c
./hello
*/

// single-line comment

/*
multi-
line 
comment
*/

/*
include standard input/output library. 
for printf function. 
we want printf to _output_ arguments.
*/
#include <stdio.h>

/* 
int: specifies the return type of main, here an integer.
      By convention, main returns an integer to indicate the 
      program’s exit status to the operating system: 0 means 
      success, while non-zero values can indicate different errors.
*/

/*
main: the starting point of program execution.
*/

/*
void: indicates main takes no arguments.
*/
int main(void)
{
    // printf: outputs "Hello, world!" to the console.
    printf("Hello, world!\n");
    /*
    we need the newline because otherwise future print statements
    will be on the same line.
    */
}