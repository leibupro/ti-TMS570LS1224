
extern void zig_main( void );

void _start( void );

static void _core_init_registers_( void );
static void _core_init_stack_pointer_( void );

void _start( void )
{
    _core_init_registers_();
    _core_init_registers_();
    zig_main();
}

static void _core_init_registers_( void )
{
    /*
     * Took over assembly code 1:1 from the TI HALCoGen sources.
     * */

    /* After reset, the CPU is in the Supervisor mode (M = 10011) */
    asm volatile(
        "mov r0, lr          \n\t"
        "mov r1, #0x0000     \n\t"
        "mov r2, #0x0000     \n\t"
        "mov r3, #0x0000     \n\t"
        "mov r4, #0x0000     \n\t"
        "mov r5, #0x0000     \n\t"
        "mov r6, #0x0000     \n\t"
        "mov r7, #0x0000     \n\t"
        "mov r8, #0x0000     \n\t"
        "mov r9, #0x0000     \n\t"
        "mov r10, #0x0000    \n\t"
        "mov r11, #0x0000    \n\t"
        "mov r12, #0x0000    \n\t"
        "mov r13, #0x0000    \n\t"
        "mrs r1, cpsr        \n\t"
        "msr spsr_cxsf, r1   \n\t"
        // Switch to FIQ mode (M = 10001)
        "cps #17             \n\t"
        "mov lr, r0          \n\t"
        "mov r8, #0x0000     \n\t"
        "mov r9, #0x0000     \n\t"
        "mov r10, #0x0000    \n\t"
        "mov r11, #0x0000    \n\t"
        "mov r12, #0x0000    \n\t"
        "mrs r1, cpsr        \n\t"
        "msr spsr_cxsf, r1   \n\t"
        // Switch to IRQ mode (M = 10010)
        "cps #18             \n\t"
        "mov lr, r0          \n\t"
        "mrs r1,cpsr         \n\t"
        "msr spsr_cxsf, r1   \n\t"
        // Switch to Abort mode (M = 10111)
        "cps #23             \n\t"
        "mov lr, r0          \n\t"
        "mrs r1,cpsr         \n\t"
        "msr spsr_cxsf, r1   \n\t"
        // Switch to Undefined Instruction Mode (M = 11011)
        "cps #27             \n\t"
        "mov lr, r0          \n\t"
        "mrs r1,cpsr         \n\t"
        "msr spsr_cxsf, r1   \n\t"
        // Switch back to Supervisor Mode (M = 10011)
        "cps #19"
    );
}


static void _core_init_stack_pointer_( void )
{
    /*
    static const unsigned int user_sp  = ( STACK_BASE + 0x00000200 );
    static const unsigned int svc_sp   = ( user_sp    + 0x00001500 );
    static const unsigned int fiq_sp   = ( svc_sp     + 0x00000100 );
    static const unsigned int irq_sp   = ( fiq_sp     + 0x00000200 );
    static const unsigned int abort_sp = ( irq_sp     + 0x00000100 );
    static const unsigned int undef_sp = ( abort_sp   + 0x00000100 );
    */
    /*
     * Hard coded variant would look like:
     *
     * asm volatile(
     *     "cps   #17                  \n\t"
     *     "ldr   sp,       =0x8000200"
     * );
     *
     * */
    // asm volatile(
    //     "cps   #17                           \n\t"
    //     "ldr   sp,       =%[val_fiq_sp]      \n\t"
    //     "cps   #18                           \n\t"
    //     "ldr   sp,       =%[val_irq_sp]      \n\t"
    //     "cps   #19                           \n\t"
    //     "ldr   sp,       =%[val_svc_sp]      \n\t"
    //     "cps   #23                           \n\t"
    //     "ldr   sp,       =%[val_abort_sp]    \n\t"
    //     "cps   #27                           \n\t"
    //     "ldr   sp,       =%[val_undef_sp]    \n\t"
    //     "cps   #31                           \n\t"
    //     "ldr   sp,       =%[val_user_sp]"
    //         :
    //         : [val_fiq_sp]   "r" ( fiq_sp ),
    //           [val_irq_sp]   "r" ( irq_sp ),
    //           [val_svc_sp]   "r" ( svc_sp ),
    //           [val_abort_sp] "r" ( abort_sp ),
    //           [val_undef_sp] "r" ( undef_sp ),
    //           [val_user_sp]  "r" ( user_sp )
    //         : "cc"
    // );

    // asm volatile(
    //     "cps   #19                  \n\t"
    //     "ldr   sp,    svc_sp        \n\t"
    //     "cps   #31                  \n\t"
    //     "ldr   sp,    user_sp       \n\n"
    //     "user_sp:  .word 0x08000000+0x00001000    \n"
    //     "svc_sp:   .word [user_sp]+0x00000100"
    // );
    asm volatile(
        "cps   #17                   \n\t"
        "ldr   sp,       fiq_sp      \n\t"
        "cps   #18                   \n\t"
        "ldr   sp,       irq_sp      \n\t"
        "cps   #19                   \n\t"
        "ldr   sp,       svc_sp      \n\t"
        "cps   #23                   \n\t"
        "ldr   sp,       abort_sp    \n\t"
        "cps   #27                   \n\t"
        "ldr   sp,       undef_sp    \n\t"
        "cps   #31                   \n\t"
        "ldr   sp,       user_sp     \n\n"

        "user_sp:  .word 0x08000000+0x00001000                                                     \n"
        "svc_sp:   .word 0x08000000+0x00001000+0x00000100                                          \n"
        "fiq_sp:   .word 0x08000000+0x00001000+0x00000100+0x00000100                               \n"
        "irq_sp:   .word 0x08000000+0x00001000+0x00000100+0x00000100+0x00000100                    \n"
        "abort_sp: .word 0x08000000+0x00001000+0x00000100+0x00000100+0x00000100+0x00000100         \n"
        "undef_sp: .word 0x08000000+0x00001000+0x00000100+0x00000100+0x00000100+0x00000100+0x00000100"
     );
}

