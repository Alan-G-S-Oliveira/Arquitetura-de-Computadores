	.text
	.globl __start
__start:
	jal main
	nop

	li $v0 10
	syscall			# syscall 10 (exit)
