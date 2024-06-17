
const Counter = extern struct
{
    FRCx   : u32,       // 0x0010,0x0030: Free Running Counter x Register
    UCx    : u32,       // 0x0014,0x0034: Up Counter x Register
    CPUCx  : u32,       // 0x0018,0x0038: Compare Up Counter x Register
    rsvd1  : u32,       // 0x001C,0x003C: Reserved
    CAFRCx : u32,       // 0x0020,0x0040: Capture Free Running Counter x Register
    CAUCx  : u32,       // 0x0024,0x0044: Capture Up Counter x Register
    rsvd2  : [ 2 ]u32,  // 0x0028,0x0048: Reserved
};

const Compare = extern struct
{
    COMPx : u32,  // 0x0050,0x0058,0x0060,0x0068: Compare x Register
    UDCPx : u32,  // 0x0054,0x005C,0x0064,0x006C: Update Compare x Register
};

const RtiReg1 = extern struct
{
    GCTRL        : u32,          // 0x0000: Global Control Register
    TBCTRL       : u32,          // 0x0004: Timebase Control Register
    CAPCTRL      : u32,          // 0x0008: Capture Control Register
    COMPCTRL     : u32,          // 0x000C: Compare Control Register
    CNT          : [ 2 ]Counter, // 0: Counter 0, 1: Counter 1
    CMP          : [ 4 ]Compare, // 0: Compare 0, ..., 3: Compare 3
    TBLCOMP      : u32,          // 0x0070: External Clock Timebase Low Compare Register
    TBHCOMP      : u32,          // 0x0074: External Clock Timebase High Compare Register
    rsvd3        : [ 2 ]u32,     // 0x0078: Reserved
    SETINTENA    : u32,          // 0x0080: Set/Status Interrupt Register
    CLEARINTENA  : u32,          // 0x0084: Clear/Status Interrupt Register
    INTFLAG      : u32,          // 0x0088: Interrupt Flag Register
    rsvd4        : u32,          // 0x008C: Reserved
    DWDCTRL      : u32,          // 0x0090: Digital Watchdog Control Register
    DWDPRLD      : u32,          // 0x0094: Digital Watchdog Preload Register
    WDSTATUS     : u32,          // 0x0098: Watchdog Status Register
    WDKEY        : u32,          // 0x009C: Watchdog Key Register
    DWDCNTR      : u32,          // 0x00A0: Digital Watchdog Down Counter
    WWDRXNCTRL   : u32,          // 0x00A4: Digital Windowed Watchdog Reaction Control
    WWDSIZECTRL  : u32,          // 0x00A8: Digital Windowed Watchdog Window Size Control
    INTCLRENABLE : u32,          // 0x00AC: RTI Compare Interrupt Clear Enable Register
    COMP0CLR     : u32,          // 0x00B0: RTI Compare 0 Clear Register
    COMP1CLR     : u32,          // 0x00B4: RTI Compare 1 Clear Register
    COMP2CLR     : u32,          // 0x00B8: RTI Compare 2 Clear Register
    COMP3CLR     : u32,          // 0x00BC: RTI Compare 3 Clear Register
};

pub const notification_compare_0: u32 = 1;
pub const notification_compare_1: u32 = 2;
pub const counter_block_0: u32 = 0;
pub const counter_block_1: u32 = 1;
const rti_reg_1: *volatile RtiReg1 = @ptrFromInt( 0xFFFFFC00 );


pub fn init() void
{
    //
    // Setup NTU source, debug options
    // and disable both counter blocks
    //
    rti_reg_1.*.GCTRL = ( ( 0x0 << 16 ) | 0x00000000 );

    // Setup timebase for free running counter 0
    rti_reg_1.*.TBCTRL = 0x00000000;

    // Enable/Disable capture event sources for both counter blocks
    rti_reg_1.*.CAPCTRL = ( 2 | 0 );

    // Setup input source compare 0-3
    rti_reg_1.*.COMPCTRL = (   0x00001000
                             | 0x00000100
                             | 0x00000000
                             | 0x00000001 );

    // Reset up counter 0
    rti_reg_1.*.CNT[ 0 ].UCx = 0x00000000;

    // Reset free running counter 0
    rti_reg_1.*.CNT[ 0 ].FRCx = 0x00000000;

    //
    // Setup up counter 0 compare value:
    //  - 0x00000000:            Divide by 2^32
    //  - 0x00000001-0xFFFFFFFF: Divide by (CPUC0 + 1)
    //
    rti_reg_1.*.CNT[ 0 ].CPUCx = 7;

    // Reset up counter 1
    rti_reg_1.*.CNT[ 1 ].UCx = 0x00000000;

    // Reset free running counter 1
    rti_reg_1.*.CNT[ 1 ].FRCx = 0x00000000;

    //
    // Setup up counter 1 compare value
    //  - 0x00000000:            Divide by 2^32
    //  - 0x00000001-0xFFFFFFFF: Divide by (CPUC1 + 1)
    //
    rti_reg_1.*.CNT[ 1 ].CPUCx = 79;

    //
    // Setup compare 0 value. This value is compared with
    // selected free running counter.
    //
    rti_reg_1.*.CMP[ 0 ].COMPx = 1000000;

    //
    // Setup update compare 0 value. This value is added to the
    // compare 0 value on each compare match.
    //
    rti_reg_1.*.CMP[ 0 ].UDCPx = 1000000;

    //
    // Setup compare 1 value. This value is compared with
    // selected free running counter.
    //
    rti_reg_1.*.CMP[ 1 ].COMPx = 50000;

    //
    // Setup update compare 1 value. This value is added to the
    // compare 1 value on each compare match.
    //
    rti_reg_1.*.CMP[ 1 ].UDCPx = 50000;

    //
    // Setup compare 2 value. This value is compared with
    // selected free running counter.
    rti_reg_1.*.CMP[ 2 ].COMPx = 8000;

    //
    // Setup update compare 2 value. This value is added to the
    // compare 2 value on each compare match.
    //
    rti_reg_1.*.CMP[ 2 ].UDCPx = 8000;

    //
    // Setup compare 3 value. This value is compared with
    // selected free running counter.
    //
    rti_reg_1.*.CMP[ 3 ].COMPx = 10000;

    //
    // Setup update compare 3 value. This value is added to the
    // compare 3 value on each compare match.
    //
    rti_reg_1.*.CMP[ 3 ].UDCPx = 10000;

    // Clear all pending interrupts.
    rti_reg_1.*.INTFLAG = 0x0007000F;

    // Disable all interrupts.
    rti_reg_1.*.CLEARINTENA = 0x00070F0F;
}


pub fn enable_notification( notification: u32 ) void
{
    rti_reg_1.*.INTFLAG = notification;
    rti_reg_1.*.SETINTENA = notification;
}


pub fn start_counter( counter: u32 ) void
{
    rti_reg_1.*.GCTRL |=
        ( @as( u32, 1 ) << ( @as( u5, @truncate( counter & 3 ) ) ) );
}


pub inline fn set_interrupt_flag( reg_value: u32 ) void
{
    rti_reg_1.*.INTFLAG = reg_value;
}

