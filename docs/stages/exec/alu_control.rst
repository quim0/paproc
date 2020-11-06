ALU control
===========

.. image:: alu_control.svg
    :align: center

The ALU control component generates the ALU control signal, that control what
function the ALU performs. First of all, the instruction opcode is compressed
from 6 to 4 bits to know the instruction format. This is done using the bits 6,
5, 4, and 2 of the opcode.

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

With this information the ALU control knows how to decode the instruction. Then
the field ``func3`` and the feld ``func7`` (in the case of I instructions) are
used to determine the ALU function. The ALU function is generated using the 3
bits of ``func3``, with the top two bits of ``func7`` (``func7[6:5]``). In case
of I instructions, the non-existent ``func7`` bits are set to 0.

.. csv-table::
	:header: "Instruction", "func3", "func7", "ALU function"
	:widths: 15, 10, 20, 20

	"ADD/ADDI", "000", "0000000", "00000"
	"SUB", "000", "0100000", "00001"
	"XOR/XORI", "100", "0000000", "10000"
	"OR/ORI", "110", "0000000", "11000"
	"AND/ANDI", "111", "0000000", "11100"
