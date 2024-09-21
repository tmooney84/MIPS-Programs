# File:	utils.asm
# Purpose:	To define utilities which will be used in MIPS programs.
# Author:	Trevor Mooney
# 
# Title to and ownership of all intellectual property rights 
# in this file are the exclusive property of Charles W. Kann.
#
# Subprograms Index:
#   Exit 		Call syscall with a server 10 to exit the program
#   PrintNewLine	Print a new line character (\n) to the console
#   PrintInt	Print a string with an integer to the console
#   PrintString	Print a string to the console
#   PromptInt	Prompt for an int & return it to the calling program.
#   NOR		Performs NOR operation on two inputs and returns the result to the calling program.
#   NAND	Performs NAND operation on two inputs and returns the result to the calling program.
#   Mult4	Multiplies a single input by 4.
#   Swap	Takes two input parameters and swaps them.



#
# Modification History
#     12/27/2014 - Initial release
#      9/13/2024 - NOR, NAND, Mult4 and Swap subprograms + associated comments added

# Subprogram:	Exit
# Author:  		Charles Kann
# Purpose:		to use syscall service 10 to exit a program
# Input/Output:	None
# Side effects:	The program is exited

.text
Exit:
    li $v0, 10
    syscall

# Subprogram:	PrintNewLine
# Author:  		Charles Kann
# Purpose:		to output a new line to the user console
# Input/Output:	None
# Side effects:	A new line character is printed to the user's console

.text
PrintNewLine:
    li $v0, 4
    la $a0, __PNL_newline
    syscall 
    jr $ra

.data
   __PNL_newline:   .asciiz "\n"


# Subprogram: 	PrintInt
# Author:		Charles W. Kann
# Purpose:		To print a string to the console
# Input:		$a0 - The address of the string to print.
#			$a1 - The value of the int to print
# Output:		None
# Side effects:	The String is printed followed by the integer value.

.text
PrintInt: 
    # Print string.  The string address is already in $a0
    li $v0, 4
    syscall
    
    # Print integer.   The integer value is in $a1, and must
    # be first moved to $a0.
    move $a0, $a1
    li $v0, 1
    syscall
    
    #Return
    jr $ra

# Subprogram: 	PrintString
# Author:		Charles W. Kann
# Purpose:		To print a string to the console
# Input:		$a0 - The address of the string to print.
# Output:		None
# Side effects:	The String is printed to the console.

.text
PrintString: 
    addi $v0, $zero, 4
    syscall
    jr $ra

# Subprogram: 	PromptInt
# Author:		Charles W. Kann
# Purpose:		To prompt the user for an integer input, and
#               	to return that input value to the caller.
# Input:		$a0 - The address of the string to print.
# Output:		$v0 - The value the user entered
# Side effects:	The String is printed followed by the integer value.

.text
PromptInt: 
    # Print the prompt, which is already in $a0
    li $v0, 4
    syscall
    
    # Read the integer.  Note: at the end of the syscall the value is
    # already in $v0, so there is no need to move it anywhere.
    li $v0, 5
    syscall
    
    #Return
    jr $ra


# Subprogram: 	NOR
# Author:		Trevor Mooney
# Purpose:		To take two input parameters and return 
#               	the NOR operation on those two parameters.

# Input:		$a0 - The value of the first integer for NOR operation
#			$a1 - The value of the second integer for NOR operation
# Output:		$v0 - The result of the NOR operation
# Side effects:	Returns the result of the NOR operation
.text
NOR:
#Perform NOR operation
nor $v0,$a0,$a1

#Return
jr $ra



# Subprogram: 	NAND
# Author:		Trevor Mooney
# Purpose:		To take two input parameters and return 
#               	a NAND operation on those two parameters.

# Input:		$a0 - The value of the first integer for NAND operation
#			$a1 - The value of the second integer for NAND operation
# Output:		$v0 - The result of the NAND operation
# Side effects:	Returns the result of the NAND operation
.text
NAND:
#Perform AND operation
and $t0, $a0, $a1

#Perform NOT operation
not $v0, $t0

#Return
jr $ra



# Subprogram: 	Mult4
# Author:		Trevor Mooney
# Purpose:		To take an input parameter and return that parameter
#			multiplied by 4 using only the shift operation.

# Input:		$a0 - The value to be multiplied
# Output:		$v0 - The result of the shift operation
# Side effects:	Returns the result of the shift operation
.text
Mult4:
#Perform shift left logical operator
sll $v0, $a0, 2

#Return
jr $ra



# Subprogram: 	Swap
# Author:		Trevor Mooney
# Purpose:		To take two input parameters and swap them using only
#               	the XOR and MOVE operations.

# Input:		$a0 - The value of the first integer to be swapped
#			$a1 - The value of the second integer to be swapped
# Output:		$v0 - The value of the first integer
#			$v1 - The value of the first integer
# Side effects:	Returns the result of the swapped integers
.text
Swap:
#Perform three XOR operations to swap values in the registers
xor $a0, $a0, $a1
xor $a1, $a0, $a1
xor $a0, $a0, $a1

#Move values into $v0 and $v1 registers
move $v0, $a0
move $v1, $a1

#Return
jr $ra





