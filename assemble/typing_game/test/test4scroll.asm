#set $sp to the high end of the memory space
li $sp, 0x00000ffc
li $gp, 0x00000e00

sw $zero, 0x10($gp)

li $s6, 0x00100000
Loop:
	addi $s7, $s7, 0x1
	bne $s6, $s7, Loop
	addi $s7, $zero, 0x0
	j Scroll_check
	
	

##Check if need to scroll down
Scroll_check:
	lw $t0, 0x10($gp)	#is last clk status negative
	bne $t0, $zero, Loop
	li $t8, 0x10000100	#address for clk_div
	lw $t1, 0($t8)		# $t1 = clk_div
	li $t9, 0x04000000
	and $t0, $t9, $t1	# $t0 = clk_div[22]
	sw $t0, 0x10($gp)
	beq $t0, $zero, Skip_scroll
	# A posedge detected.
	li $t8, 0x10000000
	sw $zero, 0x0($t8)

Skip_scroll:
