# File: Program5-3.asm
# Author: Charles Kann
# Purpose: Illustrates implementing a subprogram named PrintNewLine.
.text
main:
 # Read an input value from the user
 la $a0, prompt
 jal PrintString
 li $v0, 5
 syscall
 move $s0, $v0
 
 # Print the value back to the user
 jal PrintNewLine
 la $a0, result
 jal PrintString
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
# Input/Output: None
# Side effects: A new line character is printed to the user's console
.text
PrintNewLine:
 li $v0, 4
 la $a0, __PNL_newline
 syscall 
 jr $ra
.data
 __PNL_newline: .asciiz "\n"
# Subprogram: PrintString
# Author: Charles W. Kann
# Purpose: To print a string to the console
# Input: $a0 - The address of the string to print.
# Returns: None
# Side effects: The String is printed to the console.
.text
PrintString: 
 addi $v0, $zero, 4
 syscall
 jr $ra
 
# Subprogram: Exit
# Author: Charles Kann
# Purpose: to use syscall service 10 to exit a program
# Input/Output: None
# Side effects: The program is exited
.text
Exit:
 li $v0, 10
 syscall
