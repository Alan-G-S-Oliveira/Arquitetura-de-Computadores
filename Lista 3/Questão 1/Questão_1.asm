	.text
	.globl main
	
main:

.data
	string1: .asciiz "Introduza um numero: "
	string2: .asciiz "\nO valor em binario: "
	print0: .asciiz "0"
	print1: .asciiz "1"
	print3: .asciiz " "
	
.text
	
	ori $s3, $zero, 4  
	add $s2, $zero, $zero

	la $a0, string1
	li $v0, 4
	syscall
	
	li $v0, 5     
    	syscall
    	
    	add $s0, $v0, $zero
    	
    	la $a0, string2
    	li $v0, 4
    	syscall
    	
    	or $t1, $zero, $zero
    	
for:
	slti $t0, $s2, 32
	beq $t0, $zero, fimFor
	
	andi $s1, $s0, 0x80000000
	
	bne $s1, $zero, else
	la $a0, print0
	j fimIf
else:
	la $a0, print1

fimIf:

	li $v0, 4
	syscall

	sll $s0, $s0, 1
	addi $s2, $s2, 1
	addi $t1, $t1, 1
	
	bne $t1, $s3, else2
	la $a0, print3
	li $v0, 4
	syscall
	and $t1, $zero, $zero
else2:
	j for
	
fimFor:	
	li $v0, 10
	syscall
	jr $ra