#File: Problem3-2.asm
#Author: Trevor Mooney
#Date: September 8, 2024
#Purpose: Implement a program to calculate the 2's complement of a number entered by the user. The 
#program should only use the xori and addi operators. Your program should include a proper 
#and useful prompt for input and print the results in a meaningful manner
.text
.globl main
main:

#Display prompt
ori $v0, $zero, 4
la $a0, prompt
syscall

#Enter integer input
ori $v0, $zero, 5
syscall
move $s0, $v0

#Print Back integer
ori $v0, $zero, 4
la $a0, enteredNumber
syscall
ori $v0, $zero, 1
move $a0,$s0
syscall

#Print Back integer as binary
ori $v0, $zero, 4
la $a0, binaryNumber
syscall
ori $v0, $zero, 35
move $a0, $s0
syscall

#xori operator to implement the bitwise complement of the integer
xori $s1, $s0, 0xFFFFFFFF

#Add 1 to that number
addi $s2, $s1, 0x00000001

#print the result
ori $v0, $zero, 4
la $a0, result
syscall
ori $v0, $zero, 1
move $a0, $s2
syscall

#print the binary result
ori $v0, $zero, 4
la $a0, binaryResult
syscall
ori $v0, $zero, 35
move $a0, $s2
syscall

#end of program
ori $v0, $zero, 10
syscall

.data
prompt: .asciiz "\nEnter an integer for bitwise complement conversion: "
enteredNumber: .asciiz "\n The number entered by the user is: "
binaryNumber: .asciiz "\n The number you entered in binary is: "
result: .asciiz "\nThe 2's complement of user entered number is: "
binaryResult: .asciiz "\n The 2's complement in binary is: "

