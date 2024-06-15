
The TMS570LS1224.ccxml can be obtained from the TI uniflash utility or
from the TI code composer studio, somewhere in the project settings.

The testBoard.dat can be obtained from the TI code composer studio.
I.e.: Connect a board and detect / verify the connection with the
fancy GUI, e.g. within the procedure / dialog when creating a new
project. The path to testBoard.dat is displayed while the connection
is successfully verified.


Sometimes when everything is screwed up, one might not be able anymore
to flash the device with an error message something like:
"Error initializing flash programming: Target failed to read 0xFFFFFFF0"
or "... does not match the target endianness, not loaded." This can be
resolved by using the uniflash GUI, flash an arbitrary binary (.elf)
and tick the option "System Reset on Connect". After that, one should
be able to flash the TMS570LS1224 again through the CLI.

TBD: Figure out how to do the "System Reset on Connect" option
directly through the dslite CLI with e.g. the before flag?! Not yet
working.


