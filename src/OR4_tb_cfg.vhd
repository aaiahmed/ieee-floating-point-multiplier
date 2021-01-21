
configuration OR4_tb_cfg of OR4_tb is
  for test
    for all: OR4 use entity work.OR4(dataflow);
    end for;
  end for;
end OR4_tb_cfg;