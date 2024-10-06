#Program 7-9: Program illustrating nested blocks
.text
	# Sentinel Control Loop
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	start_outer_loop:
	# while(n !=-1)
	sne $t1, $s0, -1
	beqz $t1, end_outer_loop
	#If test for valid input 
	# if(n < -1)
	slti $t1, $s0, -1
	#else statement jump
	beqz $t1, else
	# print ("Negative input is invalid")
	la $a0, error
	jal PrintString
		b end_if
	
	
	else:
		#summation loop
		li $s1, 0 # i in for loop
		li $s2, 0 # initialize total
		
		start_inner_loop:
			sle $t1, $s1, $s0
			beqz $t1, end_inner_loop
			
			add $s2, $s2, $s1
			
			addi $s1, $s1, 1
			b start_inner_loop
		end_inner_loop: 
		la $a0, output
		move $a1, $s2
		jal PrintInt
	
	end_if:
	
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	b start_outer_loop
	
	end_outer_loop:
	jal Exit
.data
	prompt: .asciiz "\nEnter an integer, -1 to stop: "
	error: .asciiz "\nValues for n must be > 0"
	output: .asciiz "\nThe total is: "
.include "utils.asm"