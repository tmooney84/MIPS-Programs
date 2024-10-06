# File:		ch9Question2.asm
# Purpose:	To convert an integer 0 to 15 into a single hexadecimal digit
# Author:	Trevor Mooney
# Date:         10/6/2024

.text
.globl main
main:
#prompt for user input
 la $a0, prompt
 li $v0, 4
 syscall

#get user number
 li $v0, 5
 syscall
 
 move $s0, $v0

#load base address of array in register
 li $t0, 0x10010074

#multiply user input by four to represent one 32-bit word
 sll $t1, $s0, 2
 
#add it to the base address for proper pointer arithmetic
 add $t0, $t1, $t0

#print out answer
 la $a0, answer
 li $v0, 4
 syscall
 
 move $a0, $t0
 li $v0 4
 syscall
 
 la $v0, 10
 syscall
 

.data
 prompt: .asciiz "Enter a number from 0 to 15: "
 answer: .asciiz "Your number is: " 
 array_size: .word 16      
 array_base: 		# Array of pointers to strings
 
    .word str_0
    .word str_1
    .word str_2
    .word str_3
    .word str_4
    .word str_5
    .word str_6
    .word str_7
    .word str_8
    .word str_9
    .word str_a
    .word str_b
    .word str_c
    .word str_d
    .word str_e
    .word str_f
 
 # Strings
 str_0: .asciiz "0x0"
 str_1: .asciiz "0x1"
 str_2: .asciiz "0x2"
 str_3: .asciiz "0x3"
 str_4: .asciiz "0x4"
 str_5: .asciiz "0x5"
 str_6: .asciiz "0x6"
 str_7: .asciiz "0x7"
 str_8: .asciiz "0x8"
 str_9: .asciiz "0x9"
 str_a: .asciiz "0xa"
 str_b: .asciiz "0xb"
 str_c: .asciiz "0xc"
 str_d: .asciiz "0xd"
 str_e: .asciiz "0xe"
 str_f: .asciiz "0xf"
 
