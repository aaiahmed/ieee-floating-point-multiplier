
configuration INV1_tb_cfg of INV1_tb is
  for test
    for all: INV1 use entity work.INV1(dataflow);
    end for;
  end for;
end INV1_tb_cfg;
