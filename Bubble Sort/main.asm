.text
.globl main

main:
    addi $sp, $sp, -40
    move $s0, $sp
    
    li $t0, 0
    li $t2, 10

    li $t3, 10
for:
    bge $t0, $t2, fim_for

    sll $t1, $t0, 2
    add $t1, $t1, $s0
    sw $t3, 0($t1)

    addi $t0, $t0, 1
    addi $t3, $t3, -1
    j for

fim_for:

    move $a0, $s0
    li $a1, 10
    jal print_vetor

    move $a0, $s0
    li $a1, 10
    jal BubbleSort

    move $a0, $s0
    li $a1, 10
    jal print_vetor

    jr $ra
