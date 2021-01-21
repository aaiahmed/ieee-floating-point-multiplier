
configuration MUX4to1_tb_cfg of MUX4to1_tb is
  for test
    for all: MUX4to1 use entity work.MUX4to1(struct);
    end for;
  end for;
end MUX4to1_tb_cfg;