#Program: Program 2.8.2
#Author Trevor Mooney
#Question: 2
#########################################################################################
#Using the syscall services, write a program to play a middle "C" for 1 second as a reed 
#instrument using the Musical Instrument Digital Interface (MIDI) services. There are two 
#services which produce the output. What is the difference between them?

#Service 31 and 33 both produce MIDI output. The difference is that Service 31 will
#generate the tone and immediately return it. Service 33 will generate the tone then
#sleep for the tone's duration before returning.
#########################################################################################
.text
main:
#Output message
li $v0, 4
la $a0, message
syscall

#load pitch, duration, reed instrument and volume into registers
li $v0, 31
lw $a0, pitch
lw $a1, duration
lw $a2, instrument
lw $a3, volume
syscall

#Exit program
li $v0, 10
syscall

#middle "C" for 1 second as a reed instrument

.data
message: .ascii "This program will play a middle C for one second on a reed instrument."
pitch: .word 60 #middle C
duration:.word 1000 #1000 milliseconds = 1 second
instrument: .word 64 #reed instrument
volume: .word 50 #volume

