
const std = @import( "std" );
const system = @import( "system.zig" );
const gio = @import( "gio.zig" );
const vim = @import( "vim.zig" );


export fn _start() void
{
    @call( .auto, zig_main, .{} );
}


pub fn zig_main() void
{
    const n: u32 = 700000;

    @call( .always_inline, system.init, .{} );
    gio.init();
    vim.init();
    vim.channel_map( 2, 2, &foobar );


    //
    // Initial LED state ...
    //
    gio.set_bit( gio.gio_port_b, 1, 1 );
    gio.set_bit( gio.gio_port_b, 2, 0 );

    while( true )
    {
        //
        // Cheapest possible variant here. Just delaying
        // through artificially burning the CPU for a while.
        // An interrupt, triggered through, e.g. a
        // compare register / timer, should be used when
        // time is available to implement / port the TI
        // HALCoGen generated C code.
        //
        for ( 0..n ) | _ |
        {
        }
        gio.toggle_bit( gio.gio_port_b, 1 );
        gio.toggle_bit( gio.gio_port_b, 2 );
    }
}


fn foobar() callconv( .C ) void
{
    return;
}


