#define SEMIHOSTING_SYS_WRITE0  #0x04
#define SEMIHOSTING #0xAB
.text
.global dbgput_line
.global dbgput
.global newline
// param: @str
dbgput:
    push {lr}
    // move str to r1
    mov r1, r0
    mov r0, SEMIHOSTING_SYS_WRITE0  
    bkpt SEMIHOSTING
    pop {pc}

_newline_sym: .asciz "\n\r"
.align 4
dbgput_line:
    push {lr}
    // move str to r1
    mov r1, r0
    mov r0, SEMIHOSTING_SYS_WRITE0  
    bkpt SEMIHOSTING
    ldr r1,=_newline_sym
    mov r0, SEMIHOSTING_SYS_WRITE0  
    bkpt SEMIHOSTING
    pop {pc}
newline:
    push {lr}
    ldr r1,=_newline_sym
    mov r0, SEMIHOSTING_SYS_WRITE0  
    bkpt SEMIHOSTING
    pop {pc}
