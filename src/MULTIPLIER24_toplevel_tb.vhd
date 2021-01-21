

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY MULTIPLIER24_toplevel_tb is
END MULTIPLIER24_toplevel_tb;

ARCHITECTURE test OF MULTIPLIER24_toplevel_tb IS

SIGNAL start, clear,done: std_logic;
SIGNAL inA, inB: std_logic_vector(23 DOWNTO 0);
SIGNAL output: std_logic_vector(47 DOWNTO 0);
SIGNAL clk: std_logic :='0';


COMPONENT MULTIPLIER24_toplevel IS
   PORT (--

        inA               : IN std_logic_vector(23 DOWNTO 0);
        inB               : IN std_logic_vector(23 DOWNTO 0);
	start		  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;

	output		  : OUT std_logic_vector(47 DOWNTO 0);
	done		  : OUT std_logic
   );
END COMPONENT;

FOR ALL: MULTIPLIER24_toplevel USE ENTITY WORK.MULTIPLIER24_toplevel(struct);

BEGIN
   chip: MULTIPLIER24_toplevel
        port map (start=>start, clear=>clear, inA=>inA, inB=>inB, output=>output, clk=>clk, done=>done);

	clear<='1', '0' after 600ns;
   	clk <= not clk AFTER 200NS;
	start <= '0','1' after 1200ns, '0' after 1600ns, '1' after 50000ns, '0' after 51200 ns, '1' after 100000ns, '0' after 100400ns, '1' after 150000 ns, '0' after 150400 ns, '1' after 200000ns, '0' after 200400ns, '1' after 250000 ns, '0' after 250400ns, '1' after 300000ns, '0' after 300400ns;
	inA <= x"000005", x"A00000" after 50000ns, x"000000" after 100000ns, x"FFFFFF" after 150000ns, x"FFFFFD" after 200000ns, x"FFFFFF" after 250000 ns, x"800000" after 300000ns;
	inB <= x"000001", x"980000" after 50000ns, x"000005" after 100000ns, x"000004" after 150000ns, x"FFFFFD" after 200000ns, x"FFFFFF" after 250000 ns, x"000001" after 300000ns;

end test;
