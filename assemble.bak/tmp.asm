.data
var1:		.word	3	# create a single integer variable with initial value 3
array1:		.byte	'a','b'	# create a 2-element character array with elements initialized
				#   to  a  and  b
array2:		.space	40	# allocate 40 consecutive bytes, with storage uninitialized
				#   could be used as a 40-element character array, or a
				#   10-element integer array; a comment should indicate which!	
.text		
sw $t0, array2