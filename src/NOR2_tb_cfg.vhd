configuration NOR2_tb_cfg of NOR2_tb is
  for test
    for all: NOR2 use entity work.NOR2(dataflow);
    end for;
  end for;
end NOR2_tb_cfg;