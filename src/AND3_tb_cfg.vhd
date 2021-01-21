
configuration AND3_tb_cfg of AND3_tb is
  for test
    for all: AND3 use entity work.AND3(dataflow);
    end for;
  end for;
end AND3_tb_cfg;