
configuration NAND3_tb_cfg of NAND3_tb is
  for test
    for all: NAND3 use entity work.NAND3(dataflow);
    end for;
  end for;
end NAND3_tb_cfg;