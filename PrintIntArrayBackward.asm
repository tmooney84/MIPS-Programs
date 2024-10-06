.text
.globl main
main:
 la $a0, array_base
 lw $a1, array_size
 jal PrintIntArray
 jal Exit

.data
 array_size: .word 5
 array_base: 
 .word 12
 .word 7
 .word 3
 .word 5
 .word 11
 
# Subprogram: PrintIntArray
# Purpose: print an array of ints
# inputs: $a0 - the base address of the array
# $a1 - the size of the array
.text
PrintIntArray:
 addi $sp, $sp, -16 # Stack record
 sw $ra, 0($sp) 
 sw $s0, 4($sp)
 sw $s1, 8($sp)
 sw $s2, 12($sp)
 move $s0, $a0      # save the base of the array to $s0
 
 # Initialization for counter loop
 # $s1 is the ending index of the loop
 # $s2 is the loop counter
 # $s3 is the last element of the array (new loop counter)
 move $s1, $a1
 addi $s3, $s1, -1  # arr.length - 1
 move $s2, $zero 
 la $a0 open_bracket # print open bracket
 jal PrintString
loop:
 # check ending condition
 sge $t0, $s3, $zero                    ##### (int i = arr.length -1; i >= 0; i--)
 beqz  $t0, end_loop
 
 sll $t0, $s3, 2   # Multiply the loop counter by 4 to get
 		   # offset (each element is 4 big)
 add $t0, $t0, $s0 # address of next array element
 lw $a1, 0($t0)    # Next array element
 la $a0, comma
 jal PrintInt      # print the integer from array
 
 addi $s3, $s3, -1  # increment $s0
 b loop 
end_loop:
 li $v0, 4         # print close bracket
 la $a0, close_bracket
 syscall 
 lw $ra, 0($sp) 
 lw $s0, 4($sp)
 lw $s1, 8($sp)
 lw $s2, 12($sp)   # restore stack and return
 addi $sp, $sp, 16
 jr $ra 

.data
 open_bracket: .asciiz "["
 close_bracket: .asciiz "]"
 comma: .asciiz ","
.include "utils.asm"
