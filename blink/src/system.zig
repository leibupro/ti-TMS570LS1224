
const SystemBase1 = extern struct
{
    SYSPC1      : u32,           // 0x0000
    SYSPC2      : u32,           // 0x0004
    SYSPC3      : u32,           // 0x0008
    SYSPC4      : u32,           // 0x000C
    SYSPC5      : u32,           // 0x0010
    SYSPC6      : u32,           // 0x0014
    SYSPC7      : u32,           // 0x0018
    SYSPC8      : u32,           // 0x001C
    SYSPC9      : u32,           // 0x0020
    SSWPLL1     : u32,           // 0x0024
    SSWPLL2     : u32,           // 0x0028
    SSWPLL3     : u32,           // 0x002C
    CSDIS       : u32,           // 0x0030
    CSDISSET    : u32,           // 0x0034
    CSDISCLR    : u32,           // 0x0038
    CDDIS       : u32,           // 0x003C
    CDDISSET    : u32,           // 0x0040
    CDDISCLR    : u32,           // 0x0044
    GHVSRC      : u32,           // 0x0048
    VCLKASRC    : u32,           // 0x004C
    RCLKSRC     : u32,           // 0x0050
    CSVSTAT     : u32,           // 0x0054
    MSTGCR      : u32,           // 0x0058
    MINITGCR    : u32,           // 0x005C
    MSINENA     : u32,           // 0x0060
    MSTFAIL     : u32,           // 0x0064
    MSTCGSTAT   : u32,           // 0x0068
    MINISTAT    : u32,           // 0x006C
    PLLCTL1     : u32,           // 0x0070
    PLLCTL2     : u32,           // 0x0074
    SYSPC10     : u32,           // 0x0078
    DIEIDL      : u32,           // 0x007C
    DIEIDH      : u32,           // 0x0080
    VRCTL       : u32,           // 0x0084
    LPOMONCTL   : u32,           // 0x0088
    CLKTEST     : u32,           // 0x008C
    DFTCTRLREG1 : u32,           // 0x0090
    DFTCTRLREG2 : u32,           // 0x0094
    rsvd1       : u32,           // 0x0098
    rsvd2       : u32,           // 0x009C
    GPREG1      : u32,           // 0x00A0
    BTRMSEL     : u32,           // 0x00A4
    IMPFASTS    : u32,           // 0x00A8
    IMPFTADD    : u32,           // 0x00AC
    SSISR1      : u32,           // 0x00B0
    SSISR2      : u32,           // 0x00B4
    SSISR3      : u32,           // 0x00B8
    SSISR4      : u32,           // 0x00BC
    RAMGCR      : u32,           // 0x00C0
    BMMCR1      : u32,           // 0x00C4
    BMMCR2      : u32,           // 0x00C8
    CPURSTCR    : u32,           // 0x00CC
    CLKCNTL     : u32,           // 0x00D0
    ECPCNTL     : u32,           // 0x00D4
    DSPGCR      : u32,           // 0x00D8
    DEVCR1      : u32,           // 0x00DC
    SYSECR      : u32,           // 0x00E0
    SYSESR      : u32,           // 0x00E4
    SYSTASR     : u32,           // 0x00E8
    GBLSTAT     : u32,           // 0x00EC
    DEV         : u32,           // 0x00F0
    SSIVEC      : u32,           // 0x00F4
    SSIF        : u32,           // 0x00F8
};


const PcrBase = extern struct
{
    PMPROTSET0    : u32,         // 0x0000
    PMPROTSET1    : u32,         // 0x0004
    rsvd1         : [ 2 ]u32,    // 0x0008
    PMPROTCLR0    : u32,         // 0x0010
    PMPROTCLR1    : u32,         // 0x0014
    rsvd2         : [ 2 ]u32,    // 0x0018
    PPROTSET0     : u32,         // 0x0020
    PPROTSET1     : u32,         // 0x0024
    PPROTSET2     : u32,         // 0x0028
    PPROTSET3     : u32,         // 0x002C
    rsvd3         : [ 4 ]u32,    // 0x0030
    PPROTCLR0     : u32,         // 0x0040
    PPROTCLR1     : u32,         // 0x0044
    PPROTCLR2     : u32,         // 0x0048
    PPROTCLR3     : u32,         // 0x004C
    rsvd4         : [ 4 ]u32,    // 0x0050
    PCSPWRDWNSET0 : u32,         // 0x0060
    PCSPWRDWNSET1 : u32,         // 0x0064
    rsvd5         : [ 2 ]u32,    // 0x0068
    PCSPWRDWNCLR0 : u32,         // 0x0070
    PCSPWRDWNCLR1 : u32,         // 0x0074
    rsvd6         : [ 2 ]u32,    // 0x0078
    PSPWRDWNSET0  : u32,         // 0x0080
    PSPWRDWNSET1  : u32,         // 0x0084
    PSPWRDWNSET2  : u32,         // 0x0088
    PSPWRDWNSET3  : u32,         // 0x008C
    rsvd7         : [ 4 ]u32,    // 0x0090
    PSPWRDWNCLR0  : u32,         // 0x00A0
    PSPWRDWNCLR1  : u32,         // 0x00A4
    PSPWRDWNCLR2  : u32,         // 0x00A8
    PSPWRDWNCLR3  : u32,         // 0x00AC
};


const system_reg_1: *SystemBase1 = @ptrFromInt( 0xFFFFFF00 );
const pcr_reg: *PcrBase = @ptrFromInt( 0xFFFFE000 );


pub fn init() void
{
    // setup_pll omitted
    // efc_check omitted
    // mux_init omitted,
    //     -> GIOB 1 and GIOB 2 should be directly accessible.
    // setup_flash omitted
    // trim_lpo omitted
    // map_clocks omitted
    //     -> Currently just interested in writing to the GIOB port,
    //        no other clock dependent peripherals.

    init_peripherals();
}


fn init_memory( ram: u32 ) void
{
    // Enable Memory Hardware Initialization
    system_reg_1.*.MINITGCR = 0xA;
    // Enable Memory Hardware Initialization for selected RAM's
    system_reg_1.*.MSINENA = ram;

    // Wait until Memory Hardware Initialization complete
    while( ( system_reg_1.*.MSTCGSTAT & 0x00000100 ) != 0x00000100 )
    {}

    // Disable Memory Hardware Initialization
    system_reg_1.*.MINITGCR = 0x5;
}


fn init_peripherals() void
{
    //
    // Disable Peripherals before peripheral powerup.
    //
    system_reg_1.*.CLKCNTL &= ~( @as( u32, 1 ) << @as( u5, 8 ) );

    //
    // Release peripherals from reset and enable clocks
    // to all peripherals.
    //
    // Power-up all peripherals.
    //
    pcr_reg.*.PSPWRDWNCLR0 = 0xFFFFFFFF;
    pcr_reg.*.PSPWRDWNCLR1 = 0xFFFFFFFF;
    pcr_reg.*.PSPWRDWNCLR2 = 0xFFFFFFFF;
    pcr_reg.*.PSPWRDWNCLR3 = 0xFFFFFFFF;

    //
    // Release Peripheral Reset by setting PENA bit in
    // Clock Control Register. Enable peripherals.
    //
    system_reg_1.*.CLKCNTL |= ( @as( u32, 1 ) << @as( u5, 8 ) );
}

