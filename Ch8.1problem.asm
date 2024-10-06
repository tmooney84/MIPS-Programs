# Filename: Ch8.1problem.asm
# Author: Trevor Mooney
# Date: 10/4/2023
# Purpose: Program that returns the largest number and average number from a list of 4 numbers.


# Subprograms Index:
#   largestAndAverage 		Calculates the largest and average values from a list of 4 numbers
#   getLarger			Calculates the larger number of two inputs

# Modification Log: 
# 10/4/2023 - Initial Release

# PseudoCode
#Subprogram largestAndAverage($a0, $a1, $a2, $a3)
#{
# // Put arguments ($a0 - $a3) on the stack
# $s0 = getLarger($a0, $a1);
# $s0 = getLarger($s0, $a2);
# $v0 = getLarger($s0, $a3); // Largest is in $v0
 
#// Restore $a0 - $a3 from the stack
#$v1 = ($a0 + $a1 + $a2 + $a3)/ 4; // Average is in $v1
# return;
#}
#Subprogram getLarger($a0, $a1) {
# $v0 = $a0
# if ($a1 > $a0)
# $v0 = $a1
# return;
#}

.text
.globl main
main:
li $a0, 2
li $a1, 5
li $a2, 8
li $a3, 11

jal largestAndAverage

move $s0, $v0   #storing these in s registers to prevent overwrite of return values
move $s1, $v1

la $a0, maxPrompt
jal PrintString

move $a0, $s0
li $v0, 1
syscall

la $a0, nextLine
jal PrintString

la $a0, avgPrompt
jal PrintString

move $a0, $s1
li $v0, 1
syscall

#Exit the Program
li $v0, 10
syscall


.data
maxPrompt: .asciiz "Maximum Value: "
avgPrompt: .asciiz "Average Value: "
nextLine: .asciiz "\n"

.include "utils.asm"

# Subprogram: 	largestAndAverage   
# Author:		Trevor Mooney
# Purpose:		To find the largest and average values out of a group of 4 values
# Input:		$a0 - Input #1
#			$a1 - Input #2
#			$a2 - Input #3
#			$a3 - Input #4
# Output:		$v0 - Largest Value
#			$v1 - Average Value
# Side effects:		None

.text
largestAndAverage:
   addi $sp, $sp, -20	# Save stack space for 5 registers ($ra, $a0-$a3)
   sw $ra, 0($sp)
   sw $a0, 4($sp)
   sw $a1, 8($sp)
   sw $a2, 12($sp)	# Save $a2 to stack
   sw $a3, 16($sp)	# Save $a3 to stack

   # Calculating Largest number of the four using multiple getLarger calls 
   jal getLarger

   move $s0, $v0      # Save largest of $a0 and $a1
   move $a0, $s0      # Move current largest into $a0
   lw $a1, 12($sp)    # Load $a2 from stack into $a1

   jal getLarger

   move $s0, $v0      # Save largest of $s0 and $a2
   move $a0, $s0      # Move current largest into $a0
   lw $a1, 16($sp)    # Load $a3 from stack into $a1

   jal getLarger      # Largest of $s0 and $a3 in $v0

   # calculate average
   lw $t0, 4($sp)    # Load $a0
   lw $t1, 8($sp)    # Load $a1
   add $t2, $t0, $t1
   lw $t0, 12($sp)   # Load $a2
   lw $t1, 16($sp)   # Load $a3
   add $t3, $t0, $t1
   add $t2, $t2, $t3

   li $t3, 4
   div $t2, $t3
   mflo $v1         # Store the average in $v1

   # Restore saved values and adjust the stack
   lw $ra, 0($sp)    # Restore return address
   addi $sp, $sp, 20 # Restore stack pointer to clean up
   jr $ra            # Return to the caller

 # Subprogram: 	getLarger
# Author:		Trevor Mooney
# Purpose:		To find the larger of two numbers
# Input:		$a0 - Input #1
#			$a1 - Input #2
# Output:		$v0 - Larger Number
# Side effects:		None

.text
getLarger:
   addi $sp, $sp, -4   # Adjust stack pointer to save space for return address
   sw $ra, 0($sp)      # Save return address
   move $v0, $a0
   sgt $t0, $a1, $a0
   beqz $t0, LessEqual
   move $v0, $a1

LessEqual:
   lw $ra, 0($sp)      # Restore return address
   addi $sp, $sp, 4    # Restore stack pointer to clean up
   jr $ra              # Return to caller


