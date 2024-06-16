
const num_vim_channels: u8 = 128;

const isr_fn_ptr = *const fn () callconv( .C ) void;

const VimRam = extern struct
{
    ISR: [ num_vim_channels ]isr_fn_ptr,
};

const VimReg = extern struct
{
    IRQINDEX     : u32,          // 0x0000
    FIQINDEX     : u32,          // 0x0004
    rsvd1        : u32,          // 0x0008
    rsvd2        : u32,          // 0x000C
    FIRQPR0      : u32,          // 0x0010
    FIRQPR1      : u32,          // 0x0014
    FIRQPR2      : u32,          // 0x0018
    FIRQPR3      : u32,          // 0x001C
    INTREQ0      : u32,          // 0x0020
    INTREQ1      : u32,          // 0x0024
    INTREQ2      : u32,          // 0x0028
    INTREQ3      : u32,          // 0x002C
    REQMASKSET0  : u32,          // 0x0030
    REQMASKSET1  : u32,          // 0x0034
    REQMASKSET2  : u32,          // 0x0038
    REQMASKSET3  : u32,          // 0x003C
    REQMASKCLR0  : u32,          // 0x0040
    REQMASKCLR1  : u32,          // 0x0044
    REQMASKCLR2  : u32,          // 0x0048
    REQMASKCLR3  : u32,          // 0x004C
    WAKEMASKSET0 : u32,          // 0x0050
    WAKEMASKSET1 : u32,          // 0x0054
    WAKEMASKSET2 : u32,          // 0x0058
    WAKEMASKSET3 : u32,          // 0x005C
    WAKEMASKCLR0 : u32,          // 0x0060
    WAKEMASKCLR1 : u32,          // 0x0064
    WAKEMASKCLR2 : u32,          // 0x0068
    WAKEMASKCLR3 : u32,          // 0x006C
    IRQVECREG    : u32,          // 0x0070
    FIQVECREG    : u32,          // 0x0074
    CAPEVT       : u32,          // 0x0078
    rsvd3        : u32,          // 0x007C
    CHANCTRL     : [ 32 ]u32,    // 0x0080-0x0FC
};

const SystemInterrupt = enum( u32 )
{
    SYS_IRQ = 0,  // IRQ interrupt
    SYS_FIQ = 1,  // FIQ interrupt
};

const vim_ram: *volatile VimRam = @ptrFromInt( 0xFFF82000 );
const vim_reg: *volatile VimReg = @ptrFromInt( 0xFFFFFE00 );
const VIM_PARCTL: *volatile u32 = @ptrFromInt( 0xFFFFFDF0 );
const VIM_FBPARERR: *volatile u32 = @ptrFromInt( 0xFFFFFDF8 );

const s_vim_init: [ num_vim_channels ]isr_fn_ptr =
.{
    &phantom_interrupt,
    &phantom_esm_high_interrupt,   // Channel   0
    &phantom_interrupt,            // Channel   1
    &phantom_interrupt,            // Channel   2
    &phantom_interrupt,            // Channel   3
    &phantom_interrupt,            // Channel   4
    &phantom_interrupt,            // Channel   5
    &phantom_interrupt,            // Channel   6
    &phantom_interrupt,            // Channel   7
    &phantom_interrupt,            // Channel   8
    &phantom_interrupt,            // Channel   9
    &phantom_interrupt,            // Channel  10
    &phantom_interrupt,            // Channel  11
    &phantom_interrupt,            // Channel  12
    &phantom_interrupt,            // Channel  13
    &phantom_interrupt,            // Channel  14
    &phantom_interrupt,            // Channel  15
    &phantom_interrupt,            // Channel  16
    &phantom_interrupt,            // Channel  17
    &phantom_interrupt,            // Channel  18
    &phantom_interrupt,            // Channel  19
    &phantom_interrupt,            // Channel  20
    &phantom_interrupt,            // Channel  21
    &phantom_interrupt,            // Channel  22
    &phantom_interrupt,            // Channel  23
    &phantom_interrupt,            // Channel  24
    &phantom_interrupt,            // Channel  25
    &phantom_interrupt,            // Channel  26
    &phantom_interrupt,            // Channel  27
    &phantom_interrupt,            // Channel  28
    &phantom_interrupt,            // Channel  29
    &phantom_interrupt,            // Channel  30
    &phantom_interrupt,            // Channel  31
    &phantom_interrupt,            // Channel  32
    &phantom_interrupt,            // Channel  33
    &phantom_interrupt,            // Channel  34
    &phantom_interrupt,            // Channel  35
    &phantom_interrupt,            // Channel  36
    &phantom_interrupt,            // Channel  37
    &phantom_interrupt,            // Channel  38
    &phantom_interrupt,            // Channel  39
    &phantom_interrupt,            // Channel  40
    &phantom_interrupt,            // Channel  41
    &phantom_interrupt,            // Channel  42
    &phantom_interrupt,            // Channel  43
    &phantom_interrupt,            // Channel  44
    &phantom_interrupt,            // Channel  45
    &phantom_interrupt,            // Channel  46
    &phantom_interrupt,            // Channel  47
    &phantom_interrupt,            // Channel  48
    &phantom_interrupt,            // Channel  49
    &phantom_interrupt,            // Channel  50
    &phantom_interrupt,            // Channel  51
    &phantom_interrupt,            // Channel  52
    &phantom_interrupt,            // Channel  53
    &phantom_interrupt,            // Channel  54
    &phantom_interrupt,            // Channel  55
    &phantom_interrupt,            // Channel  56
    &phantom_interrupt,            // Channel  57
    &phantom_interrupt,            // Channel  58
    &phantom_interrupt,            // Channel  59
    &phantom_interrupt,            // Channel  60
    &phantom_interrupt,            // Channel  61
    &phantom_interrupt,            // Channel  62
    &phantom_interrupt,            // Channel  63
    &phantom_interrupt,            // Channel  64
    &phantom_interrupt,            // Channel  65
    &phantom_interrupt,            // Channel  66
    &phantom_interrupt,            // Channel  67
    &phantom_interrupt,            // Channel  68
    &phantom_interrupt,            // Channel  69
    &phantom_interrupt,            // Channel  70
    &phantom_interrupt,            // Channel  71
    &phantom_interrupt,            // Channel  72
    &phantom_interrupt,            // Channel  73
    &phantom_interrupt,            // Channel  74
    &phantom_interrupt,            // Channel  75
    &phantom_interrupt,            // Channel  76
    &phantom_interrupt,            // Channel  77
    &phantom_interrupt,            // Channel  78
    &phantom_interrupt,            // Channel  79
    &phantom_interrupt,            // Channel  80
    &phantom_interrupt,            // Channel  81
    &phantom_interrupt,            // Channel  82
    &phantom_interrupt,            // Channel  83
    &phantom_interrupt,            // Channel  84
    &phantom_interrupt,            // Channel  85
    &phantom_interrupt,            // Channel  86
    &phantom_interrupt,            // Channel  87
    &phantom_interrupt,            // Channel  88
    &phantom_interrupt,            // Channel  89
    &phantom_interrupt,            // Channel  90
    &phantom_interrupt,            // Channel  91
    &phantom_interrupt,            // Channel  92
    &phantom_interrupt,            // Channel  93
    &phantom_interrupt,            // Channel  94
    &phantom_interrupt,            // Channel  95
    &phantom_interrupt,            // Channel  96
    &phantom_interrupt,            // Channel  97
    &phantom_interrupt,            // Channel  98
    &phantom_interrupt,            // Channel  99
    &phantom_interrupt,            // Channel 100
    &phantom_interrupt,            // Channel 101
    &phantom_interrupt,            // Channel 102
    &phantom_interrupt,            // Channel 103
    &phantom_interrupt,            // Channel 104
    &phantom_interrupt,            // Channel 105
    &phantom_interrupt,            // Channel 106
    &phantom_interrupt,            // Channel 107
    &phantom_interrupt,            // Channel 108
    &phantom_interrupt,            // Channel 109
    &phantom_interrupt,            // Channel 110
    &phantom_interrupt,            // Channel 111
    &phantom_interrupt,            // Channel 112
    &phantom_interrupt,            // Channel 113
    &phantom_interrupt,            // Channel 114
    &phantom_interrupt,            // Channel 115
    &phantom_interrupt,            // Channel 116
    &phantom_interrupt,            // Channel 117
    &phantom_interrupt,            // Channel 118
    &phantom_interrupt,            // Channel 119
    &phantom_interrupt,            // Channel 120
    &phantom_interrupt,            // Channel 121
    &phantom_interrupt,            // Channel 122
    &phantom_interrupt,            // Channel 123
    &phantom_interrupt,            // Channel 124
    &phantom_interrupt,            // Channel 125
    &phantom_interrupt             // Channel 126
};


pub fn init() void
{
    // VIM RAM Parity Enable.
    VIM_PARCTL.* = 0xA;

    for( 0..num_vim_channels ) | chn_num |
    {
        vim_ram.*.ISR[ chn_num ] = s_vim_init[ chn_num ];
    }

    VIM_FBPARERR.* =
        @as( u32, @intFromPtr( &phantom_vim_par_err_handler ) );

    // Set IRQ/FIQ priorities.
    vim_reg.*.FIRQPR0 =
        (   ( @intFromEnum( SystemInterrupt.SYS_FIQ ) <<  0 )
          | ( @intFromEnum( SystemInterrupt.SYS_FIQ ) <<  1 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  2 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  3 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  4 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  5 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  6 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  7 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  8 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  9 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 10 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 11 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 12 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 13 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 14 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 15 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 16 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 17 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 18 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 19 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 20 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 21 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 22 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 23 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 24 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 25 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 26 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 27 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 28 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 29 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 30 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 31 ) );

    vim_reg.*.FIRQPR1 =
        (   ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  0 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  1 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  2 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  3 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  4 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  5 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  6 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  7 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  8 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  9 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 10 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 11 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 12 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 13 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 14 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 15 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 16 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 17 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 18 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 19 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 20 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 21 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 22 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 23 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 24 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 25 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 26 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 27 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 28 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 29 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 30 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 31 ) );

    vim_reg.*.FIRQPR2 =
        (   ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  0 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  1 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  2 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  3 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  4 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  5 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  6 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  7 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  8 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  9 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 10 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 11 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 12 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 13 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 14 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 15 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 16 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 17 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 18 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 19 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 20 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 21 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 22 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 23 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 24 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 25 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 26 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 27 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 28 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 29 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 30 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 31 ) );

    vim_reg.*.FIRQPR3 =
        (   ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  0 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  1 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  2 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  3 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  4 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  5 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  6 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  7 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  8 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) <<  9 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 10 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 11 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 12 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 13 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 14 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 15 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 16 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 17 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 18 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 19 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 20 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 21 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 22 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 23 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 24 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 25 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 26 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 27 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 28 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 29 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 30 )
          | ( @intFromEnum( SystemInterrupt.SYS_IRQ ) << 31 ) );

    // Enable interrupts.
    vim_reg.*.REQMASKSET0 = (   ( 1 <<  0 )
                              | ( 1 <<  1 )
                              | ( 1 <<  2 )
                              | ( 0 <<  3 )
                              | ( 0 <<  4 )
                              | ( 0 <<  5 )
                              | ( 0 <<  6 )
                              | ( 0 <<  7 )
                              | ( 0 <<  8 )
                              | ( 0 <<  9 )
                              | ( 0 << 10 )
                              | ( 0 << 11 )
                              | ( 0 << 12 )
                              | ( 0 << 13 )
                              | ( 0 << 14 )
                              | ( 0 << 15 )
                              | ( 0 << 16 )
                              | ( 0 << 17 )
                              | ( 0 << 18 )
                              | ( 0 << 19 )
                              | ( 0 << 20 )
                              | ( 0 << 21 )
                              | ( 0 << 22 )
                              | ( 0 << 23 )
                              | ( 0 << 24 )
                              | ( 0 << 25 )
                              | ( 0 << 26 )
                              | ( 0 << 27 )
                              | ( 0 << 28 )
                              | ( 0 << 29 )
                              | ( 0 << 30 )
                              | ( 0 << 31 ) );

    vim_reg.*.REQMASKSET1 = (   ( 0 <<  0 )
                              | ( 0 <<  1 )
                              | ( 0 <<  2 )
                              | ( 0 <<  3 )
                              | ( 0 <<  4 )
                              | ( 0 <<  5 )
                              | ( 0 <<  6 )
                              | ( 0 <<  7 )
                              | ( 0 <<  8 )
                              | ( 0 <<  9 )
                              | ( 0 << 10 )
                              | ( 0 << 11 )
                              | ( 0 << 12 )
                              | ( 0 << 13 )
                              | ( 0 << 14 )
                              | ( 0 << 15 )
                              | ( 0 << 16 )
                              | ( 0 << 17 )
                              | ( 0 << 18 )
                              | ( 0 << 19 )
                              | ( 0 << 20 )
                              | ( 0 << 21 )
                              | ( 0 << 22 )
                              | ( 0 << 23 )
                              | ( 0 << 24 )
                              | ( 0 << 25 )
                              | ( 0 << 26 )
                              | ( 0 << 27 )
                              | ( 0 << 28 )
                              | ( 0 << 29 )
                              | ( 0 << 30 )
                              | ( 0 << 31 ) );

    vim_reg.*.REQMASKSET2 = (   ( 0 <<  0 )
                              | ( 0 <<  1 )
                              | ( 0 <<  2 )
                              | ( 0 <<  3 )
                              | ( 0 <<  4 )
                              | ( 0 <<  5 )
                              | ( 0 <<  6 )
                              | ( 0 <<  7 )
                              | ( 0 <<  8 )
                              | ( 0 <<  9 )
                              | ( 0 << 10 )
                              | ( 0 << 11 )
                              | ( 0 << 12 )
                              | ( 0 << 13 )
                              | ( 0 << 14 )
                              | ( 0 << 15 )
                              | ( 0 << 16 )
                              | ( 0 << 17 )
                              | ( 0 << 18 )
                              | ( 0 << 19 )
                              | ( 0 << 20 )
                              | ( 0 << 21 )
                              | ( 0 << 22 )
                              | ( 0 << 23 )
                              | ( 0 << 24 )
                              | ( 0 << 25 )
                              | ( 0 << 26 )
                              | ( 0 << 27 )
                              | ( 0 << 28 )
                              | ( 0 << 29 )
                              | ( 0 << 30 )
                              | ( 0 << 31 ) );

    vim_reg.*.REQMASKSET3 = (   ( 0 <<  0 )
                              | ( 0 <<  1 )
                              | ( 0 <<  2 )
                              | ( 0 <<  3 )
                              | ( 0 <<  4 )
                              | ( 0 <<  5 )
                              | ( 0 <<  6 )
                              | ( 0 <<  7 )
                              | ( 0 <<  8 )
                              | ( 0 <<  9 )
                              | ( 0 << 10 )
                              | ( 0 << 11 )
                              | ( 0 << 12 )
                              | ( 0 << 13 )
                              | ( 0 << 14 )
                              | ( 0 << 15 )
                              | ( 0 << 16 )
                              | ( 0 << 17 )
                              | ( 0 << 18 )
                              | ( 0 << 19 )
                              | ( 0 << 20 )
                              | ( 0 << 21 )
                              | ( 0 << 22 )
                              | ( 0 << 23 )
                              | ( 0 << 24 )
                              | ( 0 << 25 )
                              | ( 0 << 26 )
                              | ( 0 << 27 )
                              | ( 0 << 28 )
                              | ( 0 << 29 )
                              | ( 0 << 30 )
                              | ( 0 << 31 ) );

    // Set Capture event sources.
    vim_reg.*.CAPEVT = (   ( 0 <<  0 )
                         | ( 0 << 16 ) );
}


//
//  @fn channel_map( request: u32,
//                   channel: u32,
//                   handler: isr_fn_ptr ) void
//
//  @brief Map selected interrupt request to the selected channel
//
//  @param[in] request: Interrupt request number 2..127
//  @param[in] channel: VIM Channel number 2..127
//  @param[in] handler: Address of the interrupt handler
//
//  This function will map selected interrupt request
//  to the selected channel.
//
pub fn channel_map( request: u32,
                    channel: u32,
                    handler: isr_fn_ptr ) void
{
    // Find the register to configure.
    const i: u32 = ( channel >> 2 );
    // Find the offset of the type.
    var j: u32 = ( channel - ( i << 2 ) );
    // Reverse the byte order.
    j = ( 3 - j );
    // Find the bit location.
    j = ( j << 3 );

    //
    // Mapping the required interrupt request
    // to the required channel.
    //
    vim_reg.*.CHANCTRL[ i ] &=
        ~( @as( u32, 0xFF ) << @as( u5, @truncate( j ) ) );
    vim_reg.*.CHANCTRL[ i ] |=
        ( request << @as( u5, @truncate( j ) ) );

    // Updating VIMRAM.
    vim_ram.*.ISR[ ( channel + 1 ) ] = handler;
}


fn phantom_interrupt() callconv( .C ) void
{
    while( true ){}
    return;
}


fn phantom_esm_high_interrupt() callconv( .C ) void
{
    while( true ){}
    return;
}


fn phantom_vim_par_err_handler() callconv( .C ) void
{
    while( true ){}
    return;
}

