
.extern _start

.section .early_init, "ax"

.arm
.p2align 2

.global _core_init_registers_
.global _core_init_stack_pointer_


_core_init_registers_:
    /* After reset, the CPU is in the Supervisor mode (M = 10011) */
    mov r1, #0x0000
    mov r2, #0x0000
    mov r3, #0x0000
    mov r4, #0x0000
    mov r5, #0x0000
    mov r6, #0x0000
    mov r7, #0x0000
    mov r8, #0x0000
    mov r9, #0x0000
    mov r10, #0x0000
    mov r11, #0x0000
    mov r12, #0x0000
    mov r13, #0x0000
    mrs r1, cpsr
    msr spsr_cxsf, r1
    /* Switch to FIQ mode (M = 10001) */
    cps #17
    mov lr, r0
    mov r8, #0x0000
    mov r9, #0x0000
    mov r10, #0x0000
    mov r11, #0x0000
    mov r12, #0x0000
    mrs r1, cpsr
    msr spsr_cxsf, r1
    /* Switch to IRQ mode (M = 10010) */
    cps #18
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1
    /* Switch to Abort mode (M = 10111) */
    cps #23
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1
    /* Switch to Undefined Instruction Mode (M = 11011) */
    cps #27
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1
    /* Switch to System Mode ( Shares User Mode registers ) (M = 11111) */
    cps #31
    mov lr, r0
    mrs r1,cpsr
    msr spsr_cxsf, r1

    mrc   p15,     #0x00,      r2,       c1, c0, #0x02
    orr   r2,      r2,         #0xF00000
    mcr   p15,     #0x00,      r2,       c1, c0, #0x02
    mov   r2,      #0x40000000
    fmxr  fpexc,   r2

    fmdrr d0,         r1,     r1
    fmdrr d1,         r1,     r1
    fmdrr d2,         r1,     r1
    fmdrr d3,         r1,     r1
    fmdrr d4,         r1,     r1
    fmdrr d5,         r1,     r1
    fmdrr d6,         r1,     r1
    fmdrr d7,         r1,     r1
    fmdrr d8,         r1,     r1
    fmdrr d9,         r1,     r1
    fmdrr d10,        r1,     r1
    fmdrr d11,        r1,     r1
    fmdrr d12,        r1,     r1
    fmdrr d13,        r1,     r1
    fmdrr d14,        r1,     r1
    fmdrr d15,        r1,     r1
    bl    next1

next1:
    bl    next2
next2:
    bl    next3
next3:
    bl    next4
next4:
    b    _core_init_stack_pointer_


_core_init_stack_pointer_:
    cps   #17
    ldr   sp,       fiq_sp
    cps   #18
    ldr   sp,       irq_sp
    cps   #19
    ldr   sp,       svc_sp
    cps   #23
    ldr   sp,       abort_sp
    cps   #27
    ldr   sp,       undef_sp
    cps   #31
    ldr   sp,       user_sp

    b    _start

user_sp:  .word 0x08000000+0x00001000
svc_sp:   .word 0x08000000+0x00001000+0x00000100
fiq_sp:   .word 0x08000000+0x00001000+0x00000100+0x00000100
irq_sp:   .word 0x08000000+0x00001000+0x00000100+0x00000100+0x00000100
abort_sp: .word 0x08000000+0x00001000+0x00000100+0x00000100+0x00000100+0x00000100
undef_sp: .word 0x08000000+0x00001000+0x00000100+0x00000100+0x00000100+0x00000100+0x00000100

