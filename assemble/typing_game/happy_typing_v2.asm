# scan-code >> ascii: 0x0 - 0x19c
# Dictionary : 0x1a0 - 
.data
0x60	# 0x0
0x0
0x0
0x0
0x0
0x0
0x0
0x51
0x31
0x0
0x0
0x0
0x5A
0x53
0x41
0x57
0x32
0x0
0x0
0x43
0x58
0x44
0x45
0x34
0x33
0x0
0x0
0x0
0x56
0x46
0x54
0x52
0x35
0x0
0x0
0x4E
0x42
0x48
0x47
0x59
0x36
0x0
0x0
0x0
0x4D
0x4A
0x55
0x37
0x38
0x0
0x0
0x2C
0x4B
0x49
0x4F
0x30
0x39
0x0
0x0
0x2E
0x2F
0x4C
0x3B
0x50
0x2D
0x0
0x0
0x0
0x27
0x0
0x5B
0x3D
0x0
0x0
0x0
0x0
0x0
0x5D
0x0
0x5C	# 0x13c
0x22	# 0x140(ascii >= 0x27)
0x0
0x0
0x0
0x0
0x3c
0x5f
0x3e
0x3f
0x29
0x21
0x40
0x23
0x24
0x25
0x5e
0x26
0x2a
0x28
0x0
0x3a
0x0
0x2b	# ascii < 3f
0x7e	# ascii == 60

#Global Variables
#last_clk_status:
.word 	0			#0x1a0
#print_cursor_x:		
.word	0x19		#0x1a4
#print_cursor_y:		
.word	0x0			#0x1a8
#print_char_address:	
.word	0x204		#0x1ac
#scroll_speeds:		
.word	0x00080000	#0x1b0
.space 80

#Dictionary
.asciiz "hello"		# 0x204
.asciiz "world"
.byte 0x03			#Meaning "end of text" in ascii-code





########### Address and Global Variables ##########
# 1K word(4byte per word)-RAM
# stack	address:0xffc
# heap  address:0xe00
# global pointer address:0xd00
##### Diveces
# clk_div: 		0x10000100
# vram_shift: 	0x10000000
# vram:			0xc0000000 - 0xdfffffff(80*60)
# keyboard:		0xa0000000
##### Global Variables
# last_clk_status 
# print_cursor_x
# print_cursor_y
# print_char_address
# scroll_speeds

# Dictionary: 0x1a0

###
# $t0 is preferred when available
# $t8 is usually used to save the tmp address


.text

Initialization:
	#set $sp to the high end of the memory space
	li $sp, 0x00000ffc
	#init the scroll speed to be 0x00080000
	lw $t0, 0x1b0
	#vram_shift = scroll_speeds
	li $t1, 0x10000000
	sw $t0, 0x0($t1)

	j Display_words	

Get_char:
	#get next char in the dictionary
	# $t0 = ascii, and move print_char_address to the next char
	lw $t8, 0x1ac
	lb $v0, 0x0($t8)

	addi $t8, $t8, 1
	sw $t8, 0x1ac
	jr $ra

# print the specified ascii to print_cursor
# a0: ascii
Print_char:
	addi $sp, $sp, -8
	sw $s0, 0($sp)
	sw $ra, 4($sp)

	move $s0, $a0	#save a0(ascii)
	lw $a0, 0x1a4	#cursor_x
	lw $a1, 0x1a8	#cursor_y
	jal xy2vram_address
	nop
	sw $s0, 0x0($v0)#save ascii >> vram
	nop
	
	lw $ra, 4($sp)
	lw $s0, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
# vram_addr = base + (y * 80 + x) << 2
#		= base + y<<8 + y<<6 + x<<2
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
	
next_print_cursor_y:
	lw $t0, 0x1a8
	bne $t0, $zero, npcy_minus_one
	li $t0, 59
	sw $t0, 0x1a8
	jr $ra
	
	npcy_minus_one:
		addi $t0, $t0, -0x1
		sw $t0, 0x1a8
		jr $ra

Display_words:

	# get a printable char
	dw_while:
		# get the next char
		jal Get_char
		move $t0, $v0
		
		# if ascii == 0x3(end of text), then exit();
		li $t1, 0x3
		beq $t1, $t0, pause
		
		# ascii != 0
		bne $t0, $zero, dw_while_done
		# ascii == 0, move to next print_cursor_x and get a printable char
		#jal next_print_cursor_x
		j dw_while

	dw_while_done:
		move $a0, $t0
		jal Print_char
		#TO DO#
		########## enqueue ########
		jal next_print_cursor_y
		#j Display_words
		
	j dw_while
	
pause:
	j pause
		
		
