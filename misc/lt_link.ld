
/* Memory map ... */
MEMORY
{
    HORUS_APP_VECS  (X)   : ORIGIN = 0x00000000, LENGTH = 0x00000020
    HORUS_APP       (RX)  : ORIGIN = 0x00000020, LENGTH = 0x000DFFE0
    STACK           (RW)  : ORIGIN = 0x08000000, LENGTH = 0x00004000
    SRAM            (RW)  : ORIGIN = 0x08004000, LENGTH = 0x0002C000
}


SECTIONS
{
    .intvecs : {} > HORUS_APP_VECS
    .text :
    {
        *(.text)
        *(.rodata*)
        . = ALIGN(4);
    } > HORUS_APP

    .ARM.exidx :
    {
        *(.ARM.exidx*)
        . = ALIGN(4);
    } > HORUS_APP

    .data :
    {
        *(.data*)
        . = ALIGN(4);
    } > SRAM
}

