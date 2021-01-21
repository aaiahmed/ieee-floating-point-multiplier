

configuration NAND2_tb_cfg of NAND2_tb is
  for test
    for all: NAND2 use entity work.NAND2(dataflow);
    end for;
  end for;
end NAND2_tb_cfg;