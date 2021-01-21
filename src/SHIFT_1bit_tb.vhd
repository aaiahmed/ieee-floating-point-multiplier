

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY SHIFT_1bit_tb is
END SHIFT_1bit_tb;

ARCHITECTURE test OF SHIFT_1bit_tb IS

SIGNAL clk: std_logic :='0';
SIGNAL sin,pin, ld_shiftb, clear, hold : std_logic;
SIGNAL qout: std_logic;

COMPONENT SHIFT_1bit
   PORT (
        hold		  : IN std_logic;
	sin               : IN std_logic;
        pin               : IN std_logic;
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qout 		  : OUT std_logic
  );
END COMPONENT;


BEGIN
   chip: SHIFT_1bit
         port map (sin=>sin,pin=>pin, hold=>hold, ld_shiftb=>ld_shiftb, clk=>clk, clear=>clear, qout=>qout);

	clk <= not clk AFTER 10NS;
	hold<= '0', '1' after 40ns, '0' after 70ns, '1' after 180ns, '0' after 220ns; 
	clear<='0', '1' after 100ns, '0' after 110ns;
	ld_shiftb <= '1', '0' after 150ns;
	pin <= '1', '0' after 10ns, '1' after 20ns, '0' after 40ns, '1' after 60ns,  '0' after 80ns;
	sin <= '1', '0' after 100ns, '1' after 120ns, '0' after 140ns, '1' after 160ns;

end test;

