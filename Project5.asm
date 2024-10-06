# Filename: Project5.asm
# Author: Trevor Mooney
# Date: 10/5/2024
# Purpose: Finds the sum of 1 to n using recursion.
#
#
# Subprograms Index:
#   Sum	 		Finds sum of 1 to n and returns an integer
#
# Modification Log: 
#   10/4/2024 - Initial Release
#
# java code
#  import java.util.Scanner;
#
#  public class Sum {
#    public static void main(String[] args)
#    {
#       Scanner scanner = new Scanner(System.in);
#       System.out.println("Enter a number: ");
#
#       int number = scanner.nextInt();
#       int sum = sumNum(number);
#
#       System.out.println("Output is: " + sum);
#      scanner.close(); 
#    }
#
#    public static int sumNum(int n){
#        if(n == 0)
#            return n;
#            
#            return n + sumNum(n-1);
#    }    
#}

.text
.globl main
main:
   #register conventions
   # $s0 - n
   # $s1 - base case: 1
   # $s2 - answer
   
   #Prompt input
   la $a0, input
   jal PromptInt
   move $s0, $v0
   
   move $a0, $s0
   
   #Call sum sub-function
   jal Sum
   
   move $s1, $v0
   
   #Print output
   la $a0, output
   move $a1, $s1
   jal PrintInt
   
   jal Exit

.data
input: .asciiz "Enter integer n: "
output: .asciiz "Sum of numbers from 1 to n is: "
.include "utils.asm"


# Subprogram: 	Sum  
# Author:		Trevor Mooney
# Purpose:		Finds sum of 1 to n and returns integer
# Input:		$a0 - input n
# Output:		$v0 - sum
# Side effects:		None

Sum:
 addi $sp, $sp -8     # push the stack
 sw $ra, 0($sp)       # save $ra
 sw $a0, 4($sp)       # save $a0
 
  
 
 seq $t0, $a0, $zero  # if(n == 0) return
 addi $v0, $zero, 0   # set return value
 bnez $t0, Return
 
 addi $a0, $a0, -1    # set n = n-1
 jal Sum              # recursive
 lw $a0, 4($sp)       # retrieve n
 add $v0, $a0, $v0    # return n + sum(n-1)
 
 Return: 
 lw $ra, 0($sp)       #pop the stack
 addi $sp, $sp, 8
 jr $ra
 

