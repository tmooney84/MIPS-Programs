# Filename: Project4.asm
# Author: Trevor Mooney
# Date: 9/24/2024
# Purpose: Print out every other capital letter in the alphabet, starting with A
# Modification Log:
#     9/24/2024 - Initial Release
# Code in C
#
# include <stdio.h>
#
# int main(){
#
#        for(int i = 65; i <= 90; i=i+2)
#        {
#                printf("%c ", i);
#        }
# return 0;
# }
#
# Pseudocode:
#
# global main()
# {
# // int i will be kept in a $t0
#
# for(i = 65; i <= 90; i = i + 2)
#	{
#		printf("%c ", i)
#	}
# }

.text
.globl main
main:
# Register Conventions:
# $t0 - i
# $s1 - test condition (Letter Z)

#Letter A loaded into $s0 as a word
lw $s0, A
#Letter Z loaded into $s1 as a word
lw $s1, Z

start_loop:
sle $t0, $s0, $s1
beqz $t0, end_loop

#code block for printing character and a space
li $v0, 11
move $a0, $s0
syscall

li $v0, 11
li $a0, 0x00000020
syscall

#skip a letter (i = i + 2)
addi $s0, $s0, 2
b start_loop

end_loop:
jal Exit

.data
A: .word 65
Z: .word 90

.include "utils.asm"
