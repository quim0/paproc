DECODE Stage
============

This stage is the one that decodes de instructions, and manages the register
file.

Components
**********
.. toctree::
   :maxdepth: 2

   register_file

Instruction format
******************

Instructions are 32 bits long, and are 32 bit aligned in memory, unaligned
memory access should raise an exception.

The `RISC-V specification document`__, defines four types of core instruction
formats: R, I, S, and U (*Section 2.2*).

.. _riscv-specs: https://riscv.org//wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

__ riscv-specs_

.. image:: riscv-encoding.png
    :align: center

.. todo:: Add immediate encoding variations.

The complete instruction set is defined on *Chapter 19*, the lower two bits of
the opcode (opcode[1:0]) are always set to 1. Important opcodes for our
implementations are:

.. csv-table::
	:header: "Opcode", "Instructions", "Instruction format"
	:widths: 10, 30, 20

	"0000011", "LB, LH, LW", "I"
	"0100011", "SB, SH, SW", "B"
	"0010011", "ADDI, XORI, ORI, ANDI", "I"
	"0110011", "ADD, SUB, XOR, OR, AND", "R"
	"1100011", "JALR, BEQ, BNE, BLT, BGE", "SB"

Registers
*********

There are 32 registers of 32 bits each one. The specific usage of each register
is defined on *Chapter 20* of the `RISC-V specification document`__. In this
project, floating point registers won't be imlemented (?). The implementation
details of the register file are described :doc:`here <register_file>`.

.. _riscv-specs: https://riscv.org//wp-content/uploads/2017/05/riscv-spec-v2.2.pdf

__ riscv-specs_

.. image:: riscv-registers.png
    :align: center


