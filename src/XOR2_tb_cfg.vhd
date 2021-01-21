
configuration XOR2_tb_cfg of XOR2_tb is
  for test
    for all: XOR2 use entity work.XOR2(struct);
    end for;
  end for;
end XOR2_tb_cfg;

