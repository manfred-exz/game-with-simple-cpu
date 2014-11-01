########### Address and Global Variables ##########
# 1K word(4byte)-RAM
# stack	address:0xffc
# heap  address:0xe00
# global address:0xd00
##### Diveces
# clk_div: 	0x10000100
# vram_shift: 	0x10000000
# vram:		0xc0000000 - 0xdfffffff(80*60)
# keyboard:	0xa0000000
##### Global Variables
# 0x10($gp):last_clk_status 
# 0x14($gp):print_cursor_x
# 0x18($gp):print_cursor_y
# 0x1c($gp):print_char_address
# 0x20($gp):scroll_speed

# Dictionary: 0x1a0

###
# $t0 is preferred when available
# $t8 is usually used to save the tmp address
lw $t8, 0x0($zero)


.text
#set $sp to the high end of the memory space
li $sp, 0x00000ffc
li $gp, 0x00000d00
#s0 is the address of keyboard
#lui $s0, 0xa000
#s1 is the address of vram	
#lui $s1, 0xc000

Initialization:
	#print_cursor_x = 0x19(24)
	li $t0, 0x19
	sw $t0, 0x14($gp)
	#print_char_address = 0x1a0
	li $t0, 0x1a0
	sw $t0, 0x1c($gp)
	#default_scroll_speed(mask, the smaller, the faster) = 0x00080000
	li $t0, 0x00080000
	sw $t0, 0x20($gp)
	li $t1, 0x10000000
	sw $t0, 0x0($t1)
	
Display_words:
	#get next char in the dictionary
	# $t0 = ascii
	lw $t8, 0x1c($gp)
	lw $t0, 0x0($t8)
	addi $t8, $t8, 4
	sw $t8, 0x1c($gp)
	
	bne $t0, $zero, Dw_not_zero
	# if ascii == '\0', then get the next char
	lw $t0, 0x0($t8)
	addi $t8, $t8, 4
	sw $t8, 0x1c($gp)
	#TO DO#
	########## print_cursor_x = random(print_cursor_x) ###########
	
Dw_not_zero:
	move $a0, $t0
	jal Print_char
	#TO DO#
	########## enqueue ########
	jal next_print_cursor_y
	#j Display_words

# print the specified ascii to print_cursor
# a0: ascii
Print_char:
	addi $sp, $sp, -4
	sw $s0, 0($sp)

	move $s0, $a0	#save a0(ascii)
	lw $a0, 0x14($gp)
	lw $a1, 0x18($gp)
	jal xy2vram_address
	sw $s0, 0x0($v0)#save ascii >> vram
	
	lw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
# vram_addr = base + y * 80 + x
#		= base + y<<6 + y<<4 + x
xy2vram_address:
	# v0 = base
	li $v0, 0xc0000000
	# v0 += y<<6 + y<<4
	sll $t0, $a1, 6
	sll $t1, $a1, 4
	add $v0, $v0, $t0
	add $v0, $v0, $t1
	# v0 += x
	add $v0, $v0, $a0
	
	jr $ra
	
next_print_cursor_y:
	lw $t0, 0x18($gp)
	bne $t0, $zero, npcy_minus_one
	li $t0, 59
	sw $t0, 0x18($gp)
	jr $ra
	
npcy_minus_one:
	addi $t0, $t0, -0x1
	sw $t0, 0x18($gp)
	jr $ra
