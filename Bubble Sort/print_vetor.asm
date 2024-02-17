.include "macros.asm"
.globl print_vetor

print_vetor:
    save_context

    move $s0, $a0
    move $s1, $a1

    li $t0, 0
for:
    bge $t0, $s1, fim_for

    sll $t1, $t0, 2
    add $t1, $t1, $s0
    lw $s2, 0($t1)

    move $a0, $s2
    li $v0, 1
    syscall

    li $a0, 32
    li $v0, 11
    syscall

    addi $t0, $t0, 1
    j for

fim_for:

    restore_context
    jr $ra
