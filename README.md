# 1. MIPS Programming Assignment 2

- [1. MIPS Programming Assignment 2](#1-mips-programming-assignment-2)
	- [1.1. Objective and Purpose](#11-objective-and-purpose)
	- [1.2. Skills and Knowledge](#12-skills-and-knowledge)
	- [1.3. Task 0](#13-task-0)
	- [1.4. Task 1: Print Assignment information](#14-task-1-print-assignment-information)
		- [1.4.1. Sample output Task 1](#141-sample-output-task-1)
	- [1.5. Task 2: Capture input as integer and test value](#15-task-2-capture-input-as-integer-and-test-value)
		- [1.5.1. Sample output Task 2](#151-sample-output-task-2)
	- [1.6. Task 3: Capture input as string and print it in a loop](#16-task-3-capture-input-as-string-and-print-it-in-a-loop)
		- [1.6.1. Sample output Task 3](#161-sample-output-task-3)
	- [1.7. Submission Checklist](#17-submission-checklist)

## 1.1. Objective and Purpose

The goal of this assignment is to continue learning MIPS assembly language. By the end of this assignment, you should be able to:

1. Read a string and integers from standard input
2. Write an algorithm in pseudocode
3. Translate that pseudocode into mips assembly code
4. Implement control structures for branching and looping

## 1.2. Skills and Knowledge

The goal of this lab is to get some initial experience programming in MIPS assembly language. Specifically, by the end of this assignment, you should feel comfortable:

1. Getting user input
2. Creating if/else style branches
3. Creating for/while loop style branches

## 1.3. Task 0

Use the `la` folder of this project to save all the practice programs we discussed in the video lectures.


## 1.4. Task 1: Print Assignment information

Begin working in the file template (`ca.asm`) provided in the `ca` folder.

Your assignment is described below in `pseudocode`

```mips
# Data for the program goes here
.data
	#string constants
	info: 		.asciiz "YOUR_NAME\nCS2810 Program #2\n"
	bye: .asciiz "Adios Amigo\n"
	
	##### Other prompt labels
	# prompt_num:
	# good_num:	
	# bad_num:	
	# prompt_str:
	
	# save space for 63 character input, plus the null character
	text:	.space	64
	
# Code goes here
.text
.globl main
main:
	# Task 1: print(info)
end:
	# print(bye)

	# exit
	li 	$v0, 10		# set up exit syscall
	syscall

## end of ca.asm
```

To complete this task print some basic information. In the `main` procedure of your `.text` directive use system calls (`syscall`) to print the following strings: 

- The user information described in the `info` label. Make sure you edit this label to include your name for this assignment.
- The `bye` string after the `end:` label

### 1.4.1. Sample output Task 1
```
YOUR_NAME
CS2810 Program #2

Bye.
-- program is finished running --
```

## 1.5. Task 2: Capture input as integer and test value

Your next task is to capture an integer from the user. 
- Define a string to prompt to enter an integer >= 10: `prompt_num`
- To capture user input as an integer, use `syscall 5`. Then, store the result from in `$s0` register. 
- Test if value of the integer. 
  - If the value is `less than 10`, print the `bad_num` string message and `jump` to the `end:` label
  - If the value is `greater or equal to 10`, print the `good_num` message.

```mips
	# Task 2: Capture number
	# print(prompt_num)
	# capture input number and save it in $s0

	# Test number
	# if (num < 10)  {
	#	print(bad_num)
	# . jump the end: label 
	# }
	# else {
	#  print(good_num) 
	# }
```
### 1.5.1. Sample output Task 2
With a number less than 10
``` 
YOUR_NAME
CS2810 Program #2
Enter a number >= 10:
9
You entered a number < 10

Bye.
-- program is finished running --
```
With a number greater or equal to 10
``` 
YOUR_NAME
CS2810 Program #2
Enter a number >= 10:
15
You entered a number >= 10

Bye.
-- program is finished running --
```

## 1.6. Task 3: Capture input as string and print it in a loop

The final task consist in capturing user input, but as a string. The input should be stored in the  `text` variable described in the `.data` section. This "variable" can store a string up to `63` characters long.

Next, create a loop to run as many times as the value you capture in `Task 2`. Remember the value is stored in your register `$s0`.

```mips
	# Task 3: Capture string
	# print(prompt_str)
	# text = readStr()	
	
	# Loop $s0 times and print string
	# while ($s0 > 0) {
	# print(text)
	# $s0 = $s0 - 1
	# }
```

### 1.6.1. Sample output Task 3
With "good" number. In this case you will print the captured string 11 times
```
YOUR_NAME
CS2810 Program #2
Enter a number >= 10:
11
You entered a number >= 10
Enter your favorite string
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid
Real Madrid

Bye.
-- program is finished running --
```


With a "bad" number. In this case after you print the "bad" number message, you jump to the `end:` label and print the bye message.
```
YOUR_NAME
CS2810 Program #2
Enter a number >= 10:
5
You entered a number < 10

Bye.
-- program is finished running --
```
## 1.7. Submission Checklist

- [x] Task 0: Save your lecture scripts in the `la` folder
- [x] Tasks 1, 2, and 3: Complete all tasks
- [x] Save and `commit` your code in github desktop
- [x] `Push` the code to `github.com`
- [x] Uploaded video of your code walkthrough in `Canvas`
- [x] Add your github repo `as a comment` to your assignment in `Canvas`.
