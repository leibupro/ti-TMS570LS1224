
.extern _core_init_registers_
.extern _dabort
.extern phantom_interrupt

.section .intvecs, "ax"

.arm
.p2align 2

.global reset_entry
.global undef_entry
.global svc_entry
.global prefetch_entry

/*
 * Currently only the first of the 8 entries
 * in the interrup vector tables is defined
 * here. That is the reset entry which branches
 * to the _start routine.
 * */
reset_entry:
    b    _core_init_registers_
undef_entry:
    b   undef_entry
svc_entry:
    b   svc_entry
prefetch_entry:
    b   prefetch_entry
    b   _dabort
    b   phantom_interrupt
    ldr pc,[pc,#-0x1b0]
    ldr pc,[pc,#-0x1b0]

