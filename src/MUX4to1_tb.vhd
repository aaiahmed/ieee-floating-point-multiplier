library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY MUX4to1_tb is
END MUX4to1_tb;

ARCHITECTURE test OF MUX4to1_tb IS

SIGNAL in0, in1, in2, in3, s0, s1, out4to1: std_logic;

COMPONENT MUX4to1
   PORT (
         in0                : IN std_logic;
         in1                : IN std_logic;
         in2                : IN std_logic;
         in3                : IN std_logic;

         s0                : IN std_logic;
         s1                : IN std_logic;

         --
	 out4to1		             : OUT std_logic --no ; here
  );
END COMPONENT;


BEGIN
   chip: MUX4to1
         port map (in0=>in0, in1=>in1, in2=>in2, in3=>in3, s0=>s0, s1=>s1, out4to1=>out4to1);

   s0 <= '0', '1' AFTER 40NS, '0' AFTER 80NS, '1' AFTER 120NS, '0' after 160ns, '1' after 200ns;
   s1 <= '0', '0' AFTER 40NS, '1' AFTER 80NS, '1' AFTER 120NS, '1' after 160ns, '1' after 200ns;

   in0 <= '0', '1' AFTER 100NS;
   in1 <= '1', '0' AFTER 100NS;
   in2 <= '1', '1' AFTER 100NS;
   in3 <= '0', '0' AFTER 100NS;

end test;