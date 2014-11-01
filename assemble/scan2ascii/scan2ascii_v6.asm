.text
#set $sp to the high end of the memory space
ori $sp, $zero, 0x0ffc
#s0 is the address of keyboard
lui $s0, 0xa000
#s1 is the address of vram	
lui $s1, 0xc000


#mask code to get scan-code
ori $s2, $zero, 0x00ff
ori $s3, $zero, 0x00f0
############MAIN##############
Polling:
	lw  $s5, 0x0($s0)	#$s5 << keyboard		
	slt $t0, $s5, $zero	#if(keyboard.ready) then $t0 = 1
	beq $t0, $zero, Polling	#if(!keyboard.ready) start over again
	
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
	bne $v0, $zero, Polling	#if not a Function key, then it's a printable code
	
Printable:
	addi $s6, $s6, -0x000e	#convert to the ascii-address
	sll  $s6, $s6, 2
	lw  $s4, 0($s6)		# $s4 = ascii
	
	#convert to caps version
	ori $a0, $s4, 0x0
	jal Caps_convert
	ori $s4, $v0, 0x0
no_caps:
	sw  $s4, 0($s1)		#SAVE TO VRAM
	addi $s1, $s1, 0x4
	j Polling
	
Wait:		
	lw  $s5, 0x0($s0)	#$s5 << keyboard		
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
	ori $t0, $zero, 0x1c0
	sw $a1, 0($t0)
	ori $v0, $zero, 0x1
	jr $ra
	
is_Ctrl:	
	ori $t0, $zero, 0x14	#Ctrl pressed?
	beq $a0, $t0, save_Ctrl
	j is_Alt
save_Ctrl:
	ori $t0, $zero, 0x1bc
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
0x22	# 0x1bc(ascii >= 0x27)
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



