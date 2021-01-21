

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY FPMUL32trunc_toplevel_tb is
END FPMUL32trunc_toplevel_tb;

ARCHITECTURE test OF FPMUL32trunc_toplevel_tb IS

SIGNAL start, clear,done: std_logic;
SIGNAL inA, inB: std_logic_vector(31 DOWNTO 0);
SIGNAL output: std_logic_vector(31 DOWNTO 0);
SIGNAL clk: std_logic :='0';
SIGNAL start_i: std_logic;

COMPONENT FPMUL32trunc_toplevel IS
   PORT (--

        inA               : IN std_logic_vector(31 DOWNTO 0); -- 31+(30-23)+(22-0)
        inB               : IN std_logic_vector(31 DOWNTO 0);
	start		  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;

	output		  : OUT std_logic_vector(31 DOWNTO 0);-- 54+(53-46)+(45-0)
	done		  : OUT std_logic
   );
END COMPONENT;

FOR ALL: FPMUL32trunc_toplevel USE ENTITY WORK.FPMUL32trunc_toplevel(Structure);

BEGIN
   chip: FPMUL32trunc_toplevel
        port map (start=>start, clear=>clear, inA=>inA, inB=>inB, output=>output, clk=>clk, done=>done);

	clear<='0', '1' after 600ns;
   	clk <= not clk AFTER 200NS;
	start_i <= '0','1' after 1200ns, '0' after 1600ns, '1' after 50000ns, '0' after 50400 ns, '1' after 100000ns, '0' after 100400ns, '1' after 150000 ns, '0' after 150400 ns, '1' after 200000ns, '0' after 200400ns, '1' after 250000 ns, '0' after 250400ns, '1' after 300000ns, '0' after 300400ns;
	start<=not start_i;
	inA <= x"40200000", x"40000000" after 50000ns, x"40B952FC" after 100000ns, x"3DCCCCCE" after 150000ns, x"00000000" after 200000ns, x"C2E4C636" after 250000 ns, x"C29B6589" after 300000ns;
	inB <= x"40980000", x"40400000" after 50000ns, x"4118637A" after 100000ns, x"3DCCCCCE" after 150000ns, x"FFFFFFFD" after 200000ns, x"425F0231" after 250000 ns, x"C22C1EBB" after 300000ns;

end test;
