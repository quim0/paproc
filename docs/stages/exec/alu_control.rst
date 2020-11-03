ALU control
===========

The ALU control component generates the ALU control signal, that control what
function the ALU performs. First of all, the instruction opcode is compressed
from 6 to 4 bits to know the type of instruction that it is. This is done using
the bits 6, 5, 4, and 2 of the opcode.

Only the top 5 bits are needed as inputs (`opcode[6:2]`), as the lowe two
(`opcode[1:0]`) are always set to 1 according to the RISC-V specification.

.. csv-table::
	:header: "Opcode", "Compressed opcode", "Instr. type", "Instr. format"
	:widths: 10, 20, 30, 10

	"0110011", "0110", "Arithmetic", "R"
	"0010011", "0010", "Arithmetic with immediate", "I"
	"0000011", "0000", "Load", "I"
	"0100011", "0100", "Store", "S"
	"1100011", "1100", "Conditional branch", "SB"
	"1101111", "1101", "Unconditional branch", "UJ"
