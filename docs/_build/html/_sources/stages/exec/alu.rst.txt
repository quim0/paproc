ALU
===

The ALU has been programmed as a combinational unit, so it can be embedded
inside the EXEC/ALU pipeline stage.

.. image:: alu.svg
    :align: center

The ALU control signal has the following correspondance with ALU functions (not
complete yet):

.. csv-table::
	:header: "ALU control", "ALU function"
	:widths: 10, 10

	"00000", "ADD"
	"00010", "SUB"
	"11100", "AND"
	"11000", "OR"
	"10000", "XOR"
