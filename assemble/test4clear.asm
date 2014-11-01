li $a0, 0

Clear_line:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $s0, 0($sp)
	
	move $a1, $a0	# y
	
	li $s0, 0
	li $s1, 80
	
Clear_line_loop:
	move $a0, $s0	# x
	jal xy2vram_address
	#sw $zero, 0($v0)
	
	beq $s0, $s1, Clear_line_end
	addi $s0, $s0, 1
	j Clear_line_loop
	
Clear_line_end:
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
	
xy2vram_address:
	# v0 = base
	li $v0, 0xc0000000
	# v0 += y<<6 + y<<4
	sll $t0, $a1, 8
	sll $t1, $a1, 6
	add $v0, $v0, $t0
	add $v0, $v0, $t1
	# v0 += x<<2
	sll $t2, $a0, 2
	add $v0, $v0, $t2
	
	jr $ra