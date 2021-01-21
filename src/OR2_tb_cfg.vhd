configuration OR2_tb_cfg of OR2_tb is
  for test
    for all: OR2 use entity work.OR2(dataflow);
    end for;
  end for;
end OR2_tb_cfg;