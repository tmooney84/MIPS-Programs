#Program File: Program2-1.asm
#Author: Trevor Mooney
#Purpose: First Program, Hello World
.text 				#Define the program instructions
main:				#Label to define the main program
	li $v0, 4 		#Load 4 into $v0 to indicate a print string.
	la $a0, greeting 	#Load the address of the greeting into $a0
	syscall			#Print greeting. The print is indicated by 
					#$v0 having a value of 4 and the string to 
	li $v0, 10 		#Load a 10 (halt) into $v0.
	syscall			#The program ends.
.data				#Define the program data.
greeting: .asciiz "Hello World"  #The string to print