
configuration OR3_tb_cfg of OR3_tb is
  for test
    for all: OR3 use entity work.OR3(dataflow);
    end for;
  end for;
end OR3_tb_cfg;