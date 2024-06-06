
const std = @import( "std" );
const foo = @import( "foo.zig" );


export fn _start() void
{
    @call( .auto, main, .{} );
}


pub fn main() void
{
    const bar: u8 = foo.bazqux();
    var baz: u8 = 0;
    baz = ( bar + 1 );
    baz = baz;
    while( true ){}
}

