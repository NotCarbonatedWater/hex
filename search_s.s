.global search_s

search_s: 
	@ r0 - *arr @ r1 - left @ r2 - right @ r3 - x
	mov r4, #1 		@ initializes "int mid"
	mov ip, r0 
loop: 
	mov r0, ip		@ r0 resetter	

	@ if (left > right)
	cmp r1, r2		@ passes if right is greater 
	bgt error

	@ mid = left + ((right - left) / 2);
	sub r4, r2, r1		@ "(right - left)"
	mov r4, r4, asr #1	@ "divide by 2"	
	add r4, r4, r1		@ + left	
	
	@ if (arr[mid] == x)
	ldrb r5, [r0, r4, lsl #2]
	cmp r5, r3 
	beq done
	
	@ else if (arr[mid] > x)
	bgt loop1
	
	@ else
	mov r1, r4
	add r1, r1, #1
	b loop
done: 
	mov r0, ip
	mov r0, r4
	bx lr
error: 
	mov r0, ip
	mov r0, #0
	bx lr 
loop1: 
	mov r2, r4 
	sub r2, r2, #1
	b loop
