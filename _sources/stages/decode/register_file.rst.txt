Register file
=============

The register file has been implemented as a module independent from the clock,
to integrate it later into the decode stage module.

It has 32 registers, each one of 32 bits in size. The register 0 (x0) has a
constant zero value, as specified by RISC-V.

.. image:: register_file.svg
    :align: center
