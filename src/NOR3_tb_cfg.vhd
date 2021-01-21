
configuration NOR3_tb_cfg of NOR3_tb is
  for test
    for all: NOR3 use entity work.NOR3(dataflow);
    end for;
  end for;
end NOR3_tb_cfg;