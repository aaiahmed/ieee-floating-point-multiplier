

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY MUL32_controller_tb is
END MUL32_controller_tb;

ARCHITECTURE test OF MUL32_controller_tb IS

SIGNAL start, cnt_done, clear, done, control2s, hold, ld_rshiftb, counter_en, counter_clear: std_logic;
SIGNAL a: std_logic_vector(1 DOWNTO 0);
SIGNAL clk: std_logic :='0';
COMPONENT MUL32_controller
   PORT (
	start		   : IN std_logic;
	a		   : IN std_logic_vector(1 DOWNTO 0);
	cnt_done	   : IN std_logic;
	clk		   : IN std_logic;
	clear		   : IN std_logic;

	done		   : OUT std_logic;
	control2s	   : OUT std_logic;
	hold		   : OUT std_logic;
	ld_rshiftb	   : OUT std_logic;
	counter_en	   : OUT std_logic;
	counter_clear	   : OUT std_logic);
END COMPONENT;


BEGIN
   chip: MUL32_controller
         port map (start=>start, cnt_done=>cnt_done, clk=>clk, clear=>clear, done=>done, control2s=>control2s, hold=>hold, ld_rshiftb=>ld_rshiftb, counter_en=>counter_en, counter_clear=>counter_clear, a=>a);

   	clk <= not clk AFTER 10NS;
	clear <= '1', '0' after 10ns;
	start <= '0','1' after 20ns;
	a<="00", "11" after 20ns, "10" after 50ns, "01" after 80ns;
	cnt_done<= '0', '1' after 120ns;

end test;
