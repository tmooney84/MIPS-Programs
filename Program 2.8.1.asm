#Program: Program 2.8.1
#Author Trevor Mooney
#Question: 1
####################################################################################################
#Write a program which prompts the user to enter their favorite type of pie. The program 
#should then print out "So you like _____ pie", where the blank line is replaced by the pie 
#type entered. What annoying feature of syscall service 8 makes it impossible at this point 
#to make the output appear on a single line?

#Service 8 automatically adds a new line statement "\n" to the end of inputted string. This makes it 
#impossible at this time to print out the entire "So you like _____ pie" string to a single line
####################################################################################################

.text
main:
#Prompt asking the user what is their favorite piece of pie
li $v0, 4
la $a0, prompt
syscall

#Read the string
li $v0, 8
la $a0, input
lw $a1, inputSize
syscall

#Output the "So you like"
li $v0, 4
la $a0, output1
syscall

#Output the input string
li $v0, 4
la $a0, input
syscall

#Output the "pie"
li $v0, 4
la $a0, output2
syscall

#Exit program
li $v0, 10
syscall

#Data section includes labels and associated data related to input, inputSize,
#prompt, output1, and output2
.data
input: .space 81
inputSize: .word 80
prompt: .asciiz "What is your favorite type of pie?\n"
output1: .asciiz "So you like "
output2: .asciiz " pie"
