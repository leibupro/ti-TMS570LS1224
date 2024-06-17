
const std = @import( "std" );
const system = @import( "system.zig" );
const gio = @import( "gio.zig" );
const vim = @import( "vim.zig" );
const rti = @import( "rti.zig" );


export fn _start() void
{
    @call( .auto, zig_main, .{} );
}


export fn _dabort() void
{
    while( true ){}
}


pub fn zig_main() void
{
    @call( .always_inline, system.init, .{} );
    gio.init();
    vim.init();
    vim.channel_map( 2, 2, &foobar );
    rti.init();
    rti.enable_notification( rti.notification_compare_0 );
    system.enable_interrupt();
    rti.start_counter( rti.counter_block_1 );

    //
    // Initial LED state ...
    //
    gio.set_bit( gio.gio_port_b, 1, 1 );
    gio.set_bit( gio.gio_port_b, 2, 0 );

    while( true ){ }
}


fn foobar() callconv( .Naked ) void
{
    asm volatile( vim.isr_prologue );

    @call( .always_inline, rti.set_interrupt_flag, .{ 1 } );
    @call( .always_inline, gio.toggle_bit, .{ gio.gio_port_b, 1 } );
    @call( .always_inline, gio.toggle_bit, .{ gio.gio_port_b, 2 } );

    asm volatile( vim.isr_epilogue );
}

