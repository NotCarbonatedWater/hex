main:
    mov r0, #1
    mov r1, #2
    bl first_s
    add r0, r0, #0
first_s:
    add r0, r0, r1
    bx lr
