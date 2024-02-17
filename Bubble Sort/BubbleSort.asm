.include "macros.asm"
.globl BubbleSort

BubbleSort:
    save_context

    move $s0, $a0   #$s0 = $a0. Início do vetor.
    move $s1, $a1   #$s1 = $a1. Tamanho do vetor.

    li $t0, 0       #i = 0.
    addi $t1, $s1, -1    #n - 1. Limite do for.
for_1:
    bge $t0, $t1, fim_for1

    addi $t2, $t0, 1     #j = i + 1.
for_2:
    bge $t2, $s1, fim_for2

    sll $t3, $t0, 2
    add $t3, $s0, $t3
    lw $s2, 0($t3)

    sll $t4, $t2, 2
    add $t4, $s0, $t4
    lw $s3, 0($t4)

    ble $s2, $s3, else
    sw $s3, 0($t3)
    sw $s2, 0($t4)
    
else:

    addi $t2, $t2, 1
    j for_2

fim_for2:

    addi $t0, $t0, 1
    j for_1

fim_for1:

    restore_context
    jr $ra
