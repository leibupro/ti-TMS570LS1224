
.extern _start

.section .intvecs, "ax"

.arm
.p2align 2

.global reset_entry

/*
 * Currently only the first of the 8 entries
 * in the interrup vector tables is defined
 * here. That is the reset entry which branches
 * to the _start routine.
 * */
reset_entry:
    b    _start

