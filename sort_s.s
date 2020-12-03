sort_s:
    mov r0, #16
    mov r1, #4
    mov r2, #32
    mov r3, #2
    mov r4, #8
    mov r5, #5

	mov ip, r0
	mov r3, #0 			@ index
	mov r6, #0			@ i
next: 
	add r6, r6, #1			@ index ++
	add r3, r3, #1			@ array element placement 
	cmp r6, r1			@ for length - 1
	bne find_max_index_s 		@ get max
	mov r0, ip
	bx lr

find_max_index_s: 
 
	ldr r2, [r0, r3, lsl #2]	@ array[0]
loop: 
	add r3, r3, #1 			@ index++ 
	cmp r3, r1
	beq done
	ldr r5, [r0, r3, lsl #2]	@ temp
	cmp r5, r2
	bgt set_max
	b loop
set_max: 				@ new max
	ldr r2, [r0, r3, lsl #2]	
	mov r4, r3
	b loop
done:  					@ switch and store
	sub r3, r6, #1
	ldr r5, [r0, r3, lsl #2]
	str r2, [r0, r3, lsl #2]	
	str r5, [r0, r4, lsl #2]	
	b next				@ next placement
