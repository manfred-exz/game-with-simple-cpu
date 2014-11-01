move $t0, $zero
loop:
lw $at, 0($t0)
addi $t0, $t0, 4
j loop