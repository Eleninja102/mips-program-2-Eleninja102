# Author: Coleton Watt
# Date: Oct 3 2022
# Description: Assigment 2: Read String print, LOOOPSS, if else
.data
	#string constants
	info: 		.asciiz "Coleton Watt\nCS2810 Program #2\n"
	bye: .asciiz "\nAdios Amigo\n"
	
	###### Other prompt labels
	 prompt_num: .asciiz "Enter a number >= 10:\n"
	good_num: .asciiz "You entered a number >= 10\n"
	bad_num: .asciiz "You entered a number < 10\n"
	prompt_str: .asciiz "Enter your favorite string\n"
	# save space for 63 character input, plus the null character
	text:	.space	64
	size: .word	 64
	
.text
.globl main
main:
	# Task 1: print(info)
	li $v0, 4 # print string
	la $a0, info
	syscall 
	# Task 2: Capture number
	# print(prompt_num)
	# capture input number and save it in $s0
	
	li $v0, 4 # print string
	la $a0,  prompt_num
	syscall 
	
	li $v0, 5 #get int input stores in $v0
	syscall 
	move $s0, $v0 #copies $v0 to $s0
	
	# Test number
	# if (num < 10)  {
	#	print(bad_num)
	# . jump the end: label 
	# }
	# else {
	#  print(good_num) 
	# }
	
	#bgtu $s0, 10, ifGreater #(only insgined ints non negative)

	bge $s0, 10, ifGreater # if $s0 => 10 j ifGreater (also works for negative)
	j ifSmaller #else j ifsmaller
ifGreater:

	li $v0, 4# print string
	la $a0, good_num
	syscall 

j endIf #leave if statemnt
ifSmaller:

	li $v0, 4 # print string
	la $a0, bad_num
	syscall 

j end #if less then 10 jump to end
endIf:
	# Task 4: Capture string
	# print(prompt_str)
	# text = readStr()
		
	li $v0, 4 # print string
	la $a0, prompt_str
	syscall 
	
	li $v0, 8 #prepare for string read
	la $a0, text #set input for string read
	lw $a1, size # set size of string
	syscall
	
	# Task 5: Loop $s0 times and print string
	# while ($s0 > 0) {
	# print(text)
	# $s0 = $s0 - 1
	# }
	
	li $t1, 0  #$t1 = 0
loop:
	add $t1, $t1, 1	#increase $t1 by one $t1 = $t1 +1
	
	li $v0, 1 #prepare print int
	move $a0, $t1 #print $t1
	#syscall 
	
	li $v0, 4 #print string
	la $a0, text #print text
	syscall 
	
	beq $s0, $t1, end #compare $s0 and $t1 if the same jump to end

j loop #else looooppp 

end:
	# print(bye)
	li $v0, 4 # print string
	la $a0, bye
	syscall

	# exit
	li 	$v0, 10		# set up exit syscall
	syscall
