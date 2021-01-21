

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY SHIFT_32bit_tb is
END SHIFT_32bit_tb;

ARCHITECTURE test OF SHIFT_32bit_tb IS

SIGNAL clk: std_logic :='0';
SIGNAL sin, ld_shiftb, clear : std_logic;
SIGNAL qsout, hold: std_logic;
SIGNAL pin, qpout: std_logic_vector(31 DOWNTO 0);


COMPONENT SHIFT_32bit
   PORT (
	hold		  : IN std_logic;
        sin               : IN std_logic;
        pin               : IN std_logic_vector(31 DOWNTO 0);
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qsout 		  : OUT std_logic; --serial out
	qpout		  : OUT std_logic_vector(31 DOWNTO 0)
  );
END COMPONENT;


BEGIN
   chip: SHIFT_32bit
         port map (hold=>hold, sin=>sin,pin=>pin, ld_shiftb=>ld_shiftb, clk=>clk, clear=>clear, qsout=>qsout, qpout=>qpout);

	clk <= not clk AFTER 10NS;
	clear<='0', '1' after 100ns, '0' after 110ns;
	ld_shiftb <= '1', '0' after 100ns;
	hold<='0', '1' after 80ns; 
	pin <= x"00000007", x"0000000A" after 20ns, x"AAAAAAAA" after 40ns, x"11111111" after 60ns, x"01010101" after 80ns, x"AAAAAAAA" after 150ns;
	sin <= '1', '0' after 100ns, '1' after 120ns, '0' after 140ns, '1' after 160ns;

end test;

