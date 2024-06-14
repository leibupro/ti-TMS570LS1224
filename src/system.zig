
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


const SystemBase2 = extern struct
{
    PLLCTL3     : u32,           // 0x0000
    rsvd1       : u32,           // 0x0004
    STCCLKDIV   : u32,           // 0x0008
    rsvd2       : [  6 ]u32,     // 0x000C
    ECPCNTRL0   : u32,           // 0x0024
    rsvd3       : [  5 ]u32,     // 0x0028
    CLK2CNTL    : u32,           // 0x003C
    VCLKACON1   : u32,           // 0x0040
    rsvd4       : [ 11 ]u32,     // 0x0044
    CLKSLIP     : u32,           // 0x0070
    rsvd5       : [ 30 ]u32,     // 0x0074
    EFC_CTLEN   : u32,           // 0x00EC
    DIEIDL_REG0 : u32,           // 0x00F0
    DIEIDH_REG1 : u32,           // 0x00F4
    DIEIDL_REG2 : u32,           // 0x00F8
    DIEIDH_REG3 : u32,           // 0x00FC
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


const SystemClockSource = enum( u32 )
{
    SYS_OSC       = 0,  // oscillator clock Source
    SYS_PLL1      = 1,  // Pll1 clock Source
    SYS_EXTERNAL1 = 3,  // external clock Source
    SYS_LPO_LOW   = 4,  // low power oscillator low clock Source
    SYS_LPO_HIGH  = 5,  // low power oscillator high clock Source
    SYS_PLL2      = 6,  // Pll2 clock Source
    SYS_EXTERNAL2 = 7,  // external 2 clock Source
    SYS_VCLK      = 9,  // synchronous VCLK1 clock Source
};


const system_reg_1: *volatile SystemBase1 = @ptrFromInt( 0xFFFFFF00 );
const system_reg_2: *volatile SystemBase2 = @ptrFromInt( 0xFFFFE100 );
const pcr_reg: *volatile PcrBase = @ptrFromInt( 0xFFFFE000 );


pub fn init() void
{
    // efc_check omitted
    // mux_init omitted,
    //     -> GIOB 1 and GIOB 2 should be directly accessible.
    // setup_flash omitted
    // map_clocks omitted
    //     -> Currently just interested in writing to the GIOB port,
    //        no other clock dependent peripherals.
    erratum_cortexr4_57();
    erratum_cortexr4_66();
    setup_pll();
    init_peripherals();
    trim_lpo();
    map_clocks();
}


// -------------------------------------------------------------------
//  Work Around for Erratum CORTEX-R4#57:
//
//  Erratum Description:
//             Conditional VMRS APSR_Nzcv, FPSCR May Evaluate
//             With Incorrect Flags
//  Workaround:
//             Disable out-of-order single-precision floating point
//             multiply-accumulate instruction completion
fn erratum_cortexr4_57() void
{
    asm volatile(
        \\ /* Read Secondary Auxiliary Control Register */
        \\ mrc p15, #0, r0, c15, c0, #0
        \\ /* Set BIT 16 (Set DOOFMACS) */
        \\ orr r0, r0, #0x10000
        \\ /* Write Secondary Auxiliary Control Register */
        \\ mcr p15, #0, r0, c15, c0, #0
    );
}


// -------------------------------------------------------------------
//  Work Around for Erratum CORTEX-R4#66:
//
//  Erratum Description:
//             Register Corruption During A Load-Multiple Instruction
//             At an Exception Vector
//  Workaround:
//             Disable out-of-order completion for divide instructions
//             in Auxiliary Control register
fn erratum_cortexr4_66() void
{
    asm volatile(
        \\ /* Read Auxiliary Control register */
        \\ mrc p15, #0, r0, c1, c0, #1
        \\ /*
        \\  * Set BIT 7 (Disable out-of-order completion
        \\  * for divide instructions.
        \\  * */
        \\ orr r0, r0, #0x80
        \\ /* Write Auxiliary Control register */
        \\ mcr p15, #0, r0, c1, c0, #1
    );
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


fn setup_pll() void
{
    //
    // Disable PLL1 and PLL2
    //
    system_reg_1.*.CSDISSET = ( 0x00000002 | 0x00000040 );

    //
    // Hardware status bit read check.
    //
    // Wait ...
    //
    while( ( system_reg_1.*.CSDIS & 0x42 ) != 0x42 )
    {
    }

    //
    // Clear Global Status Register
    //
    system_reg_1.*.GBLSTAT = 0x301;

    //
    // Configure PLL control registers
    // Initialize Pll1:
    //
    // - Setup pll control register 1:
    // - Setup reset on oscillator slip
    // - Setup bypass on pll slip
    // - setup Pll output clock divider to max before Lock
    // - Setup reset on oscillator fail
    // - Setup reference clock divider
    // - Setup Pll multiplier
    //
    system_reg_1.*.PLLCTL1 = (   0x00000000
                               | 0x20000000
                               | ( 0x1F << 24 )
                               | 0x00000000
                               | ( ( 6 - 1 ) << 16 )
                               | 0x7700 );

    //
    // - Setup pll control register 2
    // - Setup spreading rate
    // - Setup bandwidth adjustment
    // - Setup internal Pll output divider
    // - Setup spreading amount
    //
    system_reg_1.*.PLLCTL2 = (   (       255 << 22 )
                               | (         7 << 12 )
                               | ( ( 2 - 1 ) <<  9 )
                               | 61 );

    //
    // Initialize Pll2:
    //
    // - Setup pll2 control register :
    // - setup Pll output clock divider to max before Lock
    // - Setup reference clock divider
    // - Setup internal Pll output divider
    // - Setup Pll multiplier
    //
    system_reg_2.*.PLLCTL3 = (   ( ( 2 - 1 ) << 29 )
                               | (       0x1 << 24 )
                               | ( ( 6 - 1 ) << 16 )
                               | 0x7700 );

    //
    // Enable PLL(s) to start up or Lock
    //
    system_reg_1.*.CSDIS = (   0x00000000
                             | 0x00000000
                             | 0x00000008
                             | 0x00000080
                             | 0x00000000
                             | 0x00000000
                             | 0x00000000 );
}


fn trim_lpo() void
{
    const lpo_trim_value: u32 =
        ( ( ( ( @as( *u32, @ptrFromInt( 0xF00801B4 ) ) ).* )
            & 0xFFFF0000 ) >> 16 );

    //
    // Initialize Lpo:
    //
    // Load TRIM values from OTP if present
    // else load user defined values.
    //
    if( lpo_trim_value != 0xFFFF )
    {
        system_reg_1.*.LPOMONCTL = ( ( 1 << 24 ) | lpo_trim_value );
    }
    else
    {
        system_reg_1.*.LPOMONCTL = ( ( 1 << 24 ) | ( 16 << 8 ) | 16 );
    }
}


fn map_clocks() void
{
    var sys_csvstat: u32 = 0;
    var sys_csdis: u32 = 0;

    system_reg_1.*.CDDIS = (   ( 0 <<  4 )    // AVCLK 1 OFF
                             | ( 0 <<  5 )    // AVCLK 2 OFF
                             | ( 0 <<  8 )    // VCLK3 OFF
                             | ( 0 <<  9 )    // VCLK4 OFF
                             | ( 1 << 10 )    // AVCLK 3 OFF
                             | ( 0 << 11 ) ); // AVCLK 4 OFF

    //
    // Work Around for Errata SYS#46:
    //
    // Errata Description:
    //            Clock Source Switching Not Qualified with
    //            Clock Source Enable And Clock Source Valid
    // Workaround:
    //            Always check the CSDIS register to make sure the
    //            clock source is turned on and check the CSVSTAT
    //            register to make sure the clock source is valid.
    //            Then write to GHVSRC to switch the clock.
    //

    //
    // Wait until clocks are locked:
    //
    sys_csvstat = system_reg_1.*.CSVSTAT;
    sys_csdis = system_reg_1.*.CSDIS;
    while( ( sys_csvstat & ( ( sys_csdis ^ 0xFF ) & 0xFF ) ) !=
           ( ( sys_csdis ^ 0xFF ) & 0xFF ) )
    {
        sys_csvstat = system_reg_1.*.CSVSTAT;
        sys_csdis = system_reg_1.*.CSDIS;
    }

    //
    // - Map device clock domains to desired sources and configure
    //   top-level dividers.
    //
    // - All clock domains are working off the default clock
    //   sources until now.
    //

    //
    // - Setup GCLK, HCLK and VCLK clock source for normal operation,
    //   power down mode and after wakeup.
    //
    system_reg_1.*.GHVSRC =
        (   ( @intFromEnum( SystemClockSource.SYS_OSC  ) << 24 )
          | ( @intFromEnum( SystemClockSource.SYS_OSC  ) << 16 )
          | ( @intFromEnum( SystemClockSource.SYS_PLL1 ) <<  0 ) );

    //
    // - Setup RTICLK1 and RTICLK2 clocks
    //
    system_reg_1.*.RCLKSRC =
        (   ( 1 << 24 )
          | ( @intFromEnum( SystemClockSource.SYS_VCLK ) << 16 )
          | ( 1 << 8 )
          | ( @intFromEnum( SystemClockSource.SYS_VCLK ) << 0 ) );

    //
    // - Setup asynchronous peripheral clock sources for
    //   AVCLK1 and AVCLK2.
    //
    system_reg_1.*.VCLKASRC =
        (   ( @intFromEnum( SystemClockSource.SYS_VCLK ) << 8 )
          | ( @intFromEnum( SystemClockSource.SYS_VCLK ) << 0 ) );

    //
    // - Setup synchronous peripheral clock dividers
    //   for VCLK1, VCLK2, VCLK3
    //
    system_reg_1.*.CLKCNTL =
        ( ( system_reg_1.*.CLKCNTL & 0xF0FFFFFF ) | ( 1 << 24 ) );
    system_reg_1.*.CLKCNTL =
        ( ( system_reg_1.*.CLKCNTL & 0xFFF0FFFF ) | ( 1 << 16 ) );

    system_reg_2.*.CLK2CNTL =
        (   ( system_reg_2.*.CLK2CNTL & 0xFFFFF0F0 )
          | ( 1 << 8 )
          | ( 1 << 0 ) );

    system_reg_2.*.VCLKACON1 =
        (   ( ( 1 - 1 ) << 24 )
          | ( 0 << 20 )
          | ( @intFromEnum( SystemClockSource.SYS_VCLK ) << 16 )
          | ( ( 1 - 1 ) << 8 )
          | ( 0 << 4 )
          | ( @intFromEnum( SystemClockSource.SYS_VCLK ) << 0 ) );

    //
    // Now the PLLs are locked and the PLL outputs can be sped up.
    // The R-divider was programmed to be 0xF. Now this divider is
    // changed to programmed value.
    //
    //system_reg_1.*.PLLCTL1 =
    //    (   ( system_reg_1.*.PLLCTL1 & 0xE0FFFFFF )
    //      | ( ( 1 - 1 ) << 24 ) );
    //system_reg_2.*.PLLCTL3 =
    //    (   ( system_reg_2.*.PLLCTL3 & 0xE0FFFFFF )
    //      | ( ( 1 - 1 ) << 24 ) );
    // system_reg_1.*.PLLCTL1 &= 0xE0FFFFFF;
    system_reg_1.*.PLLCTL1 =
        (   ( system_reg_1.*.PLLCTL1 & 0xE0FFFFFF )
          | ( 0 << 24 ) );
    system_reg_2.*.PLLCTL3 &= 0xE0FFFFFF;

    //
    // Enable/Disable Frequency modulation.
    //
    // Line has currently no effect. Commenting it out.
    //
    // system_reg_1.*.PLLCTL2 |= 0x00000000;
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

