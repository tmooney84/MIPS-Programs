# File: Program5-2.asm
# Author: Charles Kann
# Purpose: Illustrates calling a subprogram named PrintNewLine.
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
 jal PrintNewLine
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
 result: .asciiz "You entered: "
 
# Subprogram: PrintNewLine
# Author: Charles Kann
# Purpose: to output a new line to the user console
# Input: None
# Output: None
# Side effects: A new line character is printed to the user's console
.text
PrintNewLine:
 li $v0, 4
 la $a0, __PNL_newline
 syscall 
 jr $ra
.data
 __PNL_newline: .asciiz "\n"
 
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