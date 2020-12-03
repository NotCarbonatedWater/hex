quadratic_s:
    mov r0, #2
    mov r1, #4
    mov r2, #8
    mov r3, #16
    mul r12, r0, r0
    mul r1, r12, r1
    mul r2, r0, r2
    add r0, r1, r2
    add r0, r0, r3
    bx lr

@ End marker
    add r0, r0, #0
