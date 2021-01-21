
configuration DECODER2to4_tb_cfg of DECODER2to4_tb is
  for test
    for all: DECODER2to4 use entity work.DECODER2to4(struct);
    end for;
  end for;
end DECODER2to4_tb_cfg;
