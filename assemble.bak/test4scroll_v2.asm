########### Address and Global Variables ##########
# 1K word(4byte)-RAM
# stack	address:0xffc
# heap  address:0xe00
# global address:0xd00
#####
# Device address
# clk_div: 0x10000100
# vram_shift: 0x10000000
##### Global Variables
# #0x10($gp):last_clk_status 
# 0x11($gp):print_cursor_x
# 0x12($gp):print_cursor_y
# 0x13($gp):print_char_address
# 0x14($gp):scroll_speed

# Dictionary: 0x1a0

###
# $t0 is preferred when available
# $t8 is usually used to save the tmp address

#set $sp to the high end of the memory space
#li $sp, 0x00000ffc
#li $gp, 0x00000d00

##Initialization
#Initialization:
	#print_cursor_x = 0x19(24)
#	li $t0, 0x19
#	sw $t0, 0x11($gp)
#	#print_char_address = 0x1a0
#	li $t0, 0x1a0
#	sw $t0, 0x13($gp)
#	#default_scroll_speed(mask, the smaller, the faster) = 0x00080000
#	li $t0, 0x00080000
#	sw $t0, 0x14($gp)

Clk_check:
	li $t0, 0x10000100
	lw $s0, 0x0($t0)	# $s0 = clk_div
	li $t1, 0x10000000
	sgt $t3, $s0, $t1
	beq $t3, $zero, Clk_check	# clk_div != 0x100 ?
	li $t2, 0x01000000
	sw $t2, 0x0($t1)
	j Clk_check