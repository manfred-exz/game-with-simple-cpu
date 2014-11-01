########### Address and Global Variables ##########
# 1K word(4byte)-RAM
# stack	address:0xffc
# heap  address:0xe00
# global address:0xd00
##### Global Variables
# 0x10($gp):last_clk_status 
# 0x11($gp):print_cursor_x
# 0x12($gp):print_cursor_y
# 0x13($gp):print_char_address
# 0x14($gp):scroll_speed

# Dictionary: 0x1a0

###
# $t0 is preferred when available
# $t8 is usually used to save the tmp address

#set $sp to the high end of the memory space
li $sp, 0x00000ffc
li $gp, 0x00000d00

##Initialization
Initialization:
	#print_cursor_x = 0x19(24)
	li $t0, 0x19
	sw $t0, 0x11($gp)
	#print_char_address = 0x1a0
	li $t0, 0x1a0
	sw $t0, 0x13($gp)
	#default_scroll_speed(mask, the smaller, the faster) = 0x00080000
	li $t0, 0x00080000
	sw $t0, 0x14($gp)

############MAIN##############
Polling:


##Check if need to scroll down
Scroll_check:
	lw $t0, 0x10($gp)	#is last clk status negative
	bne $t0, $zero, Update_and_Skip_scroll
	li $t8, 0x10000100	#address for clk_div
	lw $t1, 0($t8)		# $t1 = clk_div
	lw $t9, 0x14($gp)	# $t9 = speed
	and $t0, $t9, $t1	# $t0 = clk_div[22]
	sw $t0, 0x10($gp)
	beq $t0, $zero, Scroll_check
	# A posedge detected.
	li $t8, 0x10000000
	lw $t0, 0x14($gp)
	sw $zero, 0x0($t8)
	
Update_and_Skip_scroll:
	li $t8, 0x10000100	#address for clk_div
	lw $t1, 0($t8)
	lw $t9, 0x14($gp)	# $t9 = speed
	and $t0, $t9, $t1
	sw $t0, 0x10($gp)
	j Scroll_check
