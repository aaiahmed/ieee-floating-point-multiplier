

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY MUX33bit1sel_tb is
END MUX33bit1sel_tb;

ARCHITECTURE test OF MUX33bit1sel_tb IS

SIGNAL clk: std_logic :='0';
SIGNAL en, clear : std_logic;
SIGNAL q: std_logic_vector(4 DOWNTO 0);

COMPONENT MUX33bit1sel IS
   PORT (--
         in0                : IN std_logic_vector(32 DOWNTO 0);
         in1                : IN std_logic_vector(32 DOWNTO 0);
	
         s0                : IN std_logic;

	 out33 		    : OUT std_logic_vector(32 DOWNTO 0)
   );
END COMPONENT;

SIGNAL s0: std_logic;
SIGNAL in0, in1, out33                : std_logic_vector(32 DOWNTO 0);

BEGIN
   chip: MUX33bit1sel
         port map (in0=>in0, in1=>in1, s0=>s0, out33=>out33);

	s0<='0', '1' after 100ns;
	in0<="000000000000000000000000000000001";
	in1<="000000000000000000000000000000011";

end test;

