

configuration AND2_tb_cfg of AND2_tb is
  for test
    for all: AND2 use entity work.AND2(dataflow);
    end for;
  end for;
end AND2_tb_cfg;