# File: Program5-1.asm
# Author: Charles Kann
# Purpose: Illustrates a subprogram named Exit
.text
main:
 # Read an input value from the user
 li $v0, 4
 la $a0, prompt
 syscall
 li $v0, 5
 syscall
 move $s0, $v0
 
 # Print the value back to the user
 li $v0, 4
 la $a0, result
 syscall
 li $v0, 1
 move $a0, $s0
 syscall
 
 # Call the Exit subprogram to exit
 jal Exit
 
.data
 prompt: .asciiz "Please enter an integer: "
 result: .asciiz "\nYou entered: "
 
# Subprogram: Exit
# Author: Charles Kann
# Purpose: to use syscall service 10 to exit a program
# Input: None
# Output: None
# Side effects: The program is exited
.text
Exit:
 li $v0, 10
 syscall