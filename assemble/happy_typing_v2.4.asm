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
.word	0x2			#0x1a8
#print_char_address:	
.word	0x204		#0x1ac
#scroll_speeds:		
.word	0x00080000	#0x1b0
#checked_char_address:
.word 	0x207		#0x1b4
#line_y_need_to_clear
.word	0x2			#0x1b8
#Ctrl
.word	0			#0x1bc
#Shift
.word	0			#0x1c0
#Alt
.word	0			#0x1c4
#isCapsOn
.word	0			#0x1c8
.space 56

#Dictionary			# 0x204
.asciiz "  "
.asciiz "THIS" 		# 0x207
.asciiz "MORNING" 
.asciiz "A" 
.asciiz "TINY" 
.asciiz "FLY" 
.asciiz "WAS," 
.asciiz "TRUE" 
.asciiz "TO" 
.asciiz "ITS" 
.asciiz "NAME" 
.asciiz "AND" 
.asciiz "NATURE," 
.asciiz "FLYING" 
.asciiz "ABOUT" 
.asciiz "IN" 
.asciiz "THE" 
.asciiz "VICINITY" 
.asciiz "OF" 
.asciiz "MY" 
.asciiz "DESK." 
.asciiz "IT" 
.asciiz "REALLY" 
.asciiz "WAS" 
.asciiz "VERY" 
.asciiz "TINY" 
.asciiz "–" 
.asciiz "A" 
.asciiz "FRUIT" 
.asciiz "FLY," 
.asciiz "I’D" 
.asciiz "GUESS." 
.asciiz "AT" 
.asciiz "ONE" 
.asciiz "POINT" 
.asciiz "IT" 
.asciiz "LANDED" 
.asciiz "IN" 
.asciiz "FRONT" 
.asciiz "OF" 
.asciiz "ME." 
.asciiz "I" 
.asciiz "BRUSHED" 
.asciiz "IT" 
.asciiz "ASIDE" 
.asciiz "AND" 
.asciiz "IT" 
.asciiz "RESUMED" 
.asciiz "FLITTING" 
.asciiz "ABOUT" 
.asciiz "IN" 
.asciiz "ITS" 
.asciiz "PATTERNLESS" 
.asciiz "PATH." 
.asciiz "THEN" 
.asciiz "IT" 
.asciiz "LANDED" 
.asciiz "AGAIN," 
.asciiz "AND" 
.asciiz "AGAIN" 
.asciiz "I" 
.asciiz "AIMED" 
.asciiz "TO" 
.asciiz "BRUSH" 
.asciiz "IT" 
.asciiz "ASIDE." 
.asciiz "BUT" 
.asciiz "THIS" 
.asciiz "TIME," 
.asciiz "MY" 
.asciiz "AIM" 
.asciiz "WAS" 
.asciiz "OFF." 
.asciiz "IT" 
.asciiz "WAS" 
.asciiz "PROBABLY" 
.asciiz "A" 
.asciiz "MATTER" 
.asciiz "OF" 
.asciiz "ONLY" 
.asciiz "A" 
.asciiz "MILLIMETRE" 
.asciiz "OR" 
.asciiz "SO," 
.asciiz "BUT" 
.asciiz "MY" 
.asciiz "FINGER" 
.asciiz "LANDED," 
.asciiz "NOT" 
.asciiz "NEXT" 
.asciiz "TO" 
.asciiz "THE" 
.asciiz "FLY," 
.asciiz "BUT" 
.asciiz "ON" 
.asciiz "IT," 
.asciiz "AND" 
.asciiz "SO" 
.asciiz "WHAT" 
.asciiz "WAS" 
.asciiz "MEANT" 
.asciiz "TO" 
.asciiz "BE" 
.asciiz "A" 
.asciiz "BRUSHING" 
.asciiz "MOTION" 
.asciiz "BECAME" 
.asciiz "INSTEAD" 
.asciiz "A" 
.asciiz "SQUIDGING" 
.asciiz "MOTION." 
.asciiz "THE" 
.asciiz "FLY" 
.asciiz "WAS" 
.asciiz "SO" 
.asciiz "SMALL" 
.asciiz "THAT" 
.asciiz "IT" 
.asciiz "DIDN’T" 
.asciiz "OFFER" 
.asciiz "THE" 
.asciiz "LEAST" 
.asciiz "RESISTANCE" 
.asciiz "TO" 
.asciiz "THE" 
.asciiz "PRESSURE" 
.asciiz "OF" 
.asciiz "MY" 
.asciiz "FINGER." 
.asciiz "COMPLIANTLY," 
.asciiz "IT" 
.asciiz "TRANSFORMED" 
.asciiz "ITSELF" 
.asciiz "INTO" 
.asciiz "A" 
.asciiz "DARK" 
.asciiz "SMUDGE." 
.asciiz "NOT" 
.asciiz "A" 
.asciiz "GORY" 
.asciiz "OR" 
.asciiz "BLOODY" 
.asciiz "SMUDGE;" 
.asciiz "NOT" 
.asciiz "ONE" 
.asciiz "WITH" 
.asciiz "THE" 
.asciiz "LEAST" 
.asciiz "DETAIL" 
.asciiz "OR" 
.asciiz "VARIATION" 
.asciiz "–" 
.asciiz "NOT" 
.asciiz "TO" 
.asciiz "MY" 
.asciiz "NAKED" 
.asciiz "EYE," 
.asciiz "ANYWAY." 
.asciiz "JUST" 
.asciiz "A" 
.asciiz "SMALL," 
.asciiz "UNIFORM," 
.asciiz "RATHER" 
.asciiz "FAINT" 
.asciiz "MARK." 
.asciiz "MARK." 
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
	li $t8, 0x10000000
	sw $zero, 0($t8)
	
#	wait:
#	#WAIT
#	# $t0 = clk_div
#	li $t8, 0x10000100
#	lw $t0, 0($t8)
#	# $t0 = clk_div[22]
#	li $t1, 0x10000000
#	and $t0, $t0, $t1
#	beq $t0, $zero, wait
	
	
	li $t0, 0x80000
	li $t8, 0x10000000
	sw $zero, 0($t8)
	nop
	sw $t0, 0($t8)
	j Main_loop

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
	
	li $t1, 59
	bne $t0, $t1, npcy_plus_one
	
	li $t0, 0
	sw $t0, 0x1a8
	move $v0, $t0
	jr $ra
	
	npcy_plus_one:
		addi $t0, $t0, 0x1
		sw $t0, 0x1a8
		move $v0, $t0
		jr $ra
		
next_print_cursor_x:
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
	jal get_random_num
	
	li $t1, 79
	sgt $t0, $v0, $t1
	beq $t0, $zero, npcx_skip
	addi $v0, $v0, -79
	
npcx_skip:
	
	sw $v0, 0x1a4
	
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
	
# Generate a suedo-random number
#	!Note that only the 6-0 bit of $v0 is random
get_random_num:
	#get clk_div
	li $t8, 0x10000100
	lw $v0, 0($t8)
	
	sll $v0, $v0, 2
	addi $v0, $v0, -23784
	
	
	li $t0, 0x7f
	and $v0, $v0, $t0
	
	jr $ra
	
# a0 = clear_cursor_y
Clear_line:
	addi $sp, $sp, -12
	sw $s1, 8($sp)
	sw $ra, 4($sp)
	sw $s0, 0($sp)
	
	move $a1, $a0	# y
	
	li $s0, 0
	li $s1, 80
	
Clear_line_loop:
	move $a0, $s0	# x
	jal xy2vram_address
	sw $zero, 0($v0)
	
	beq $s0, $s1, Clear_line_end
	addi $s0, $s0, 1
	j Clear_line_loop
	
Clear_line_end:
	lw $s1, 8($sp)
	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra
	
	
	
Main_loop:
	# Get keyboard input, check if equals top(queue)
	jal Polling
	lw $t8, 0x1b4				# t0 = top(queue) (ascii)
	lw $t0, 0($t8)
	beq $t0, $v0, char_check	# if input_ascii == top(queue)
	j skip_char_check
	
	char_check:
		# if queue is empty, no need to dequeue
		lw $t1, 0x1ac
		lw $t2, 0x1b4
		beq $t1, $t2, skip_char_check
		
		# if not empty, calculate the position of that char, and clear that line
		addi $t0, $t2, 1
		sw $t0, 0x1b4
		
		## TO DO ## get cursor_y
		addi $a0, $t2, -0x207
		jal Clear_line

skip_char_check:
	# Time to Print next char?
	#mask code
	li $t1, 0x400000
	#load clk_div address
	li $t8, 0x10000100
	
	#DETECT a posedge
	
	# check if last clk[22] == 1
	# get last clk
	lw $t0, 0x1a0
	
	and $t0, $t0, $t1
	beq $t0, $zero, Main_loop_1

	# update last clk
	lw $t2, 0($t8)
	sw $t2, 0x1a0
	j Main_loop
		
Main_loop_1:

	# $t0 = clk_div
	lw $t0, 0($t8)
	#update
	sw $t0, 0x1a0
	# $t0 = clk_div[22]
	and $t0, $t0, $t1
	
	
	beq $t0, $zero, Main_loop
	
	j Display_words
	
	

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
		
		# End of word
		# ascii == 0, move to next print_cursor_x and get a printable char
		jal next_print_cursor_x
		j dw_while

	dw_while_done:
		move $a0, $t0
		jal Print_char
		
		#TO DO#
		########## enqueue ########
		jal next_print_cursor_y
		move $a0, $v0
		jal Clear_line
		#j Display_words
		
	j Main_loop
	
pause:
	j pause
	
	
################### Key Board Processing Program ###################	



############MAIN##############
Polling:
	addi $sp, $sp, -20
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $s3, 12($sp)
	sw $ra, 16($sp)


	#### INIT ####
	#s0 is the address of keyboard
	lui $s0, 0xa000
	#s1 is the address of vram	
	lui $s1, 0xc000
	#mask code to get scan-code
	ori $s2, $zero, 0x00ff
	ori $s3, $zero, 0x00f0


	li $t8, 0xa0000000
	lw  $s5, 0($t8)	#$s5 << keyboard		
	slt $t0, $s5, $zero	#if(keyboard.ready) then $t0 = 1
	beq $t0, $zero, Polling_end	#if(!keyboard.ready) start over again
	
	and $s6, $s5, $s2	#s6: get the current byte of scan-code
	
	is_E0:
	ori $t2, $zero, 0xe0
	beq $s6, $t2, Polling
	
	is_F0:
	beq $s6, $s3, Wait	#if scan-code == f0, wait for next key_code
				#otherwise, Check is Function key?
	
	#Check if a funct key is pressed, skip the normal key decode process
	or  $a0, $zero, $s6
	ori $a1, $zero, 0x1
	jal Judge_funct_key
	bne $v0, $zero, Polling_end	#if not a Function key, then it's a printable code
	
	Printable:
	addi $s6, $s6, -0x000e	#convert to the ascii-address
	sll  $s6, $s6, 2
	lw  $s4, 0($s6)		# $s4 = ascii
	
	#convert to caps version
	ori $a0, $s4, 0x0
	jal Caps_convert
	ori $s4, $v0, 0x0
	no_caps:
# Print
	#sw  $s4, 0($s1)		#SAVE TO VRAM
	#addi $s1, $s1, 0x4
	move $v0, $s4
	
Polling_end:
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $ra, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
Wait:		
	li $t8, 0xa0000000
	lw  $s5, 0x0($t8)	#$s5 << keyboard		
	slt $t0, $s5, $zero	#if(keyboard.ready) then $t0 = 1
	beq $t0, $zero, Wait	#if(!keyboard.ready) start over again
	and $s6, $s5, $s2	#s6: get the current byte of scan-code
	
	#Check if a funct key is released, cancel it
	or  $a0, $zero, $s6
	ori $a1, $zero, 0x0
	jal Judge_funct_key
	#No matter it is a funct_key or normal_key, skip the decode now
	j Polling
	

###############Judge If Function Key Pressed/Released###############
#Judge if the scan_code is of a function key, set the memory accordingly.
#a0:
#	scan_code: 8bit
#a1: 
#	press:1/release:0
#v0:
#	isFunctionKey?
####
#$t0: funct_key.scan_code
#addi $sp, $sp, 0	#no $sx is used
Judge_funct_key:

is_Caps:	#When release Caps_lock_key, change the state.
	ori $t0, $zero, 0x58	#Caps pressed?
	bne $a0, $t0, is_Shift	#not Caps
	bne $a1, $zero, is_Caps_return#is Caps, but not released, ignore it.
	ori $t1, $zero, 0x1c8	#load current caps state
	lw  $t2, 0($t1)
	xor $t2, $t2, 0x1	#reverse the caps state
	sw  $t2, 0($t1)
is_Caps_return:
	ori $v0, $zero, 0x1	#finished, go back
	jr $ra


is_Shift:	
	#Check if a function key is pressed.
	ori $t0, $zero, 0x12	#Shift pressed?
	beq $a0, $t0, save_Shift
	ori $t0, $zero, 0x59
	beq $a0, $t0, save_Shift
	j is_Ctrl		#Shift not pressed
save_Shift:
	#if shift pressed, reverse caps_lock
	ori $t0, $zero, 0x01c0
	sw $a1, 0($t0)
	ori $v0, $zero, 0x1
	jr $ra
	
is_Ctrl:	
	ori $t0, $zero, 0x14	#Ctrl pressed?
	beq $a0, $t0, save_Ctrl
	j is_Alt
save_Ctrl:
	ori $t0, $zero, 0x01bc
	sw $a1, 0($t0)
	ori $v0, $zero, 0x1
	jr $ra
	
is_Alt:
	ori $t0, $zero, 0x11
	beq $a0, $t0, save_Alt
	j is_Fx
save_Alt:
	ori $t0, $zero, 0x1c4
	sw $a1, 0($t0)
	ori $v0, $zero, 0x1
	jr $ra
	
is_Fx:
	ori $t0, $zero, 0xe
	slt $t1, $a0, $t0	# $t1 = scan_code < 0xe ?
	beq $t1, $zero, is_Not_used# $t1 == 0, >= 0xe
	#beq $t1, $zero, is_Shift# $t1 == 0, >= 0xe
	
	ori $v0, $zero, 0x1	# Don't process.
	jr $ra	
	
is_Not_used:
	ori $t0, $zero, 0x5d
	slt $t1, $t0, $a0	# $t1 = 0x5d < scan_code ?
	beq $t1, $zero, is_Other
	
	ori $v0, $zero, 0x1	# Don't process.
	jr $ra	
	
is_Other:
	ori $v0, $zero, 0x0
	jr $ra

###############Convert ascii according to Caps/Shift###############
#Judge if the scan_code is of a function key, set the memory accordingly.
#a0: ascii
#	 ?
####
Caps_convert:

	ori $t0, $zero, 0x26
	ori $t1, $zero, 0x61
	slt $t2, $a0, $t1	# $t2 = (ascii < 0x61)
	slt $t3, $t0, $a0	# $t3 = (0x26 < ascii)
	beq $t2, $zero, goback_caps
	beq $t3, $zero, goback_caps


	addi $sp, $sp, -0x8
	sw $s2, 0($sp)
	sw $s3, 4($sp)
	
	ori $t0, $zero, 0x1c8	# $s0 = isCapsOn?
	lw $s2, 0($t0)
	ori $t0, $zero, 0x1c0	# $s1 = isShiftPressed?
	lw $s3, 0($t0)

	ori $t0, $zero, 0x3f
	slt $t1, $a0, $t0		# $t1 = ascii < 0x3f
	bne $t1, $zero, stage1		# ascii < 0x3f, go to stage1

	ori $t0, $zero, 0x60		# ascii == ` ?
	beq $a0, $t0, caps_shift_1e	
	ori $t0, $zero, 0x5b		# ascii == [ ?
	beq $a0, $t0, caps_shift_20
	ori $t0, $zero, 0x5c		# ascii == \ ?
	beq $a0, $t0, caps_shift_20
	ori $t0, $zero, 0x5d		# ascii == ] ?
	beq $a0, $t0, caps_shift_20
	#add $zero, $zero, $zero		#!!!!!!!!!!!!!!!!!!!!!BUG!!!!!!!!!!!!!!!!!!!!!#
	j stage2			# not all above
caps_shift_1e:
	beq $s3, $zero, end_caps_no_convert
	addi $v0, $a0, 0x1e
	j end_caps
caps_shift_20:
	beq $s3, $zero, end_caps_no_convert
	addi $v0, $a0, 0x20
	j end_caps
stage1:
	beq $s3, $zero, end_caps_no_convert	# Shift pressed? Otherwise skip convert
	sll $t0, $a0, 2			# $t0 = ascii << 2
	addi $t0, $t0, 0xa4		# convert address
	lw  $t1, 0($t0)
	ori $v0, $t1, 0x0		# converted ascii
	j end_caps

stage2:
	
	xor $t0, $s2, $s3	#if need to convert then $t0 = 0
	bne $t0, $zero, end_caps_no_convert
	
	or  $t0, $zero, 0x20
	add $v0, $a0, $t0
	j end_caps
	
end_caps_no_convert:
	add $v0, $a0, $zero
end_caps:
	lw $s2, 0($sp)
	lw $s3, 4($sp)
	addi $sp, $sp, 0x8
goback_caps:
	jr $ra
