
//
// For this use case, no bit-aligned fields are required. Therefore
// it is recommended to use an extern struct instead of a packed
// struct. An extern struct has a natural alignment of 4 concerning
// the target architecture (armeb-freestanding).
//

const GioReg = extern struct
{
    GCR0:   u32,    // 0x0000: Global Control Register
    rsvd:   u32,    // 0x0004: Reserved
    INTDET: u32,    // 0x0008: Interrupt Detect Register
    POL:    u32,    // 0x000C: Interrupt Polarity Register
    ENASET: u32,    // 0x0010: Interrupt Enable Set Register
    ENACLR: u32,    // 0x0014: Interrupt Enable Clear Register
    LVLSET: u32,    // 0x0018: Interrupt Priority Set Register
    LVLCLR: u32,    // 0x001C: Interrupt Priority Clear Register
    FLG:    u32,    // 0x0020: Interrupt Flag Register
    OFF1:   u32,    // 0x0024: Interrupt Offset A Register
    OFF2:   u32,    // 0x0028: Interrupt Offset B Register
    EMU1:   u32,    // 0x002C: Emulation 1 Register
    EMU2:   u32,    // 0x0030: Emulation 2 Register
};

const GioPort = extern struct
{
    DIR:    u32,    // 0x0000: Data Direction Register
    DIN:    u32,    // 0x0004: Data Input Register
    DOUT:   u32,    // 0x0008: Data Output Register
    DSET:   u32,    // 0x000C: Data Output Set Register
    DCLR:   u32,    // 0x0010: Data Output Clear Register
    PDR:    u32,    // 0x0014: Open Drain Register
    PULDIS: u32,    // 0x0018: Pullup Disable Register
    PSL:    u32,    // 0x001C: Pull Up/Down Selection Register
};

//
// If a packed structs were used, the alignment of address values
// to 4 bytes for the pointer has to be explicitly specified, i.e.:
//
// const gio_port_b: *align( @alignOf( u32 ) ) GioPort =
//     @ptrFromInt( 0xFFF7BC54 );
//

const gio_reg: *volatile GioReg = @ptrFromInt( 0xFFF7BC00 );
pub const gio_port_b: *volatile GioPort = @ptrFromInt( 0xFFF7BC54 );


pub fn init() void
{
    gio_reg.*.GCR0 = 1;
    gio_reg.*.ENACLR = 0xFF;
    gio_reg.*.LVLCLR = 0xFF;

    // gio_port_b.*.DIR = 0x6;

    //
    // Set direction to output for bit 1 and 2,
    // user LEDs A and B.
    //
    gio_port_b.*.DIR = (   ( 0 << 0 )
                         | ( 1 << 1 )
                         | ( 1 << 2 )
                         | ( 0 << 3 )
                         | ( 0 << 4 )
                         | ( 0 << 5 )
                         | ( 0 << 6 )
                         | ( 0 << 7 ) );

    //
    // Data output, init all at zero.
    //
    gio_port_b.*.DOUT = (   ( 0 << 0 )
                          | ( 0 << 1 )
                          | ( 0 << 2 )
                          | ( 0 << 3 )
                          | ( 0 << 4 )
                          | ( 0 << 5 )
                          | ( 0 << 6 )
                          | ( 0 << 7 ) );

    //
    // Open drain enable. Disabled for all.
    //
    gio_port_b.*.PDR = (   ( 0 << 0 )
                         | ( 0 << 1 )
                         | ( 0 << 2 )
                         | ( 0 << 3 )
                         | ( 0 << 4 )
                         | ( 0 << 5 )
                         | ( 0 << 6 )
                         | ( 0 << 7 ) );

    //
    // Pullup / pulldown selection.
    //
    gio_port_b.*.PSL = (   ( 0 << 0 )
                         | ( 0 << 1 )
                         | ( 0 << 2 )
                         | ( 0 << 3 )
                         | ( 0 << 4 )
                         | ( 0 << 5 )
                         | ( 0 << 6 )
                         | ( 0 << 7 ) );

    //
    // Pullup / pulldown enable.
    //
    gio_port_b.*.PULDIS = (   ( 0 << 0 )
                            | ( 0 << 1 )
                            | ( 0 << 2 )
                            | ( 0 << 3 )
                            | ( 0 << 4 )
                            | ( 0 << 5 )
                            | ( 0 << 6 )
                            | ( 0 << 7 ) );
    //
    // Interrupt polarity.
    //
    gio_reg.*.POL = 0x0000;

    //
    // Interrupt level.
    //
    gio_reg.*.LVLSET = 0x0000;

    //
    // Clear all pending interrupts ...
    //
    gio_reg.*.FLG = 0xFF;

    //
    // Interrupt enable. Currently all 16 to zero.
    //
    gio_reg.*.ENASET = 0x0000;
}


pub fn set_bit( port: *volatile GioPort, bit: u32, value: u32 ) void
{
    const actual_reg_value: u32 =
        ( @as( u32, 1 ) << @as( u5, @truncate( bit ) ) );
    if( value != 0 )
    {
        port.*.DSET = actual_reg_value;
    }
    else
    {
        port.*.DCLR = actual_reg_value;
    }
}


pub fn toggle_bit( port: *volatile GioPort,
                   bit: u32 ) callconv( .C ) void
{
    const bit_mask: u32 =
        ( @as( u32, 1 ) << @as( u5, @truncate( bit ) ) );
    const actual_reg_value: u32 = ( port.*.DIN & bit_mask );

    if( actual_reg_value != 0 )
    {
        port.*.DCLR = bit_mask;
    }
    else
    {
        port.*.DSET = bit_mask;
    }
}

