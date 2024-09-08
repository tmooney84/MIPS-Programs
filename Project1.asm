#File: Project1.asm
#Author: Trevor Mooney
#Date: September 8, 2024

#Purpose:The Ideal Gas Law calculates the volume of gas given the pressure (P), amount of gas (n), and the temperature (T).  
#V = ( nRT ) / P     R=8
#Implement a program that prompts a user for the values of n, T, and P.  It should then calculate V and output it.
#Make sure the prompts to the user are useful (i.e. Please enter an integer value for T: ) and the output has meaning (i.e. The volume is: ).

.text
.globl main
main:
#Display welcome
ori $v0, $zero, 4
la $a0, welcome
syscall

#Display promptN
ori $v0, $zero, 4
la $a0, promptN
syscall

#Enter integer n input
ori $v0, $zero, 5
syscall
move $s0, $v0

#Display promptT
ori $v0, $zero, 4
la $a0, promptT
syscall

#Enter integer T input
ori $v0, $zero, 5
syscall
move $s1, $v0

#Display promptP
ori $v0, $zero, 4
la $a0, promptP
syscall

#Enter integer P input
ori $v0, $zero, 5
syscall
move $s2, $v0

#Multiplying n * R * T
mulo $t0, $s0, 8
mulo $t1, $t0, $s1

#Dividing by P
div $t2, $t1, $s2

#Print Result
#print the result
ori $v0, $zero, 4
la $a0, result
syscall
ori $v0, $zero, 1
move $a0, $t2
syscall

.data
welcome: .asciiz "\n Welcome to the Ideal Gas Law Calculator!\n"

promptN: .asciiz "\n Enter the number of moles of the substance: "

promptT: .asciiz "\n Enter the temperature in Kelvin: "

promptP: .asciiz "\n Enter the pressure in pascals: "

result: .asciiz "\n The volume in cubic meters is: "