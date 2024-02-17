	.text
	.globl main
	
main:
.data
	string1: .asciiz "Introduza um numero: "
	string2: .asciiz "\nO valor em binario e: "
	
.text
	or $t0, $zero, $zero
	
	la $a0, string1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	or $t1, $v0, $zero
	
	la $a0, string2
	li $v0, 4
	syscall
	
for:
	slti $t2, $t0, 32
	beq $t2, $zero, fimFor
	
	andi $t3, $t1, 0x80000000
	
	addi, $t4, $t3, 30
	or $a0, $t4, $zero
	li $v0, 4
	syscall
	
	addi $t0, $t0, 1
	
	j for

fimFor:

	li $v0, 10
	syscall
	jr $ra
