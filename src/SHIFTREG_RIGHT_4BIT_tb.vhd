

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY SHIFTREG_RIGHT_4BIT_tb is
END SHIFTREG_RIGHT_4BIT_tb;

ARCHITECTURE test OF SHIFTREG_RIGHT_4BIT_tb IS

SIGNAL clk: std_logic :='0';
SIGNAL d, clear : std_logic;
SIGNAL q: std_logic_vector(3 DOWNTO 0);

COMPONENT SHIFTREG_RIGHT_4BIT
   PORT (
	 d                  : IN std_logic;
         clk                : IN std_logic;
	 clear             : IN std_logic; 
         q                : OUT std_logic_vector(3 DOWNTO 0)
  );
END COMPONENT;


BEGIN
   chip: SHIFTREG_RIGHT_4BIT
         port map (clk=>clk, d=>d, clear=> clear, q=>q);

	d <= '0', '1' AFTER 10NS, '0' AFTER 20NS, '1' AFTER 30NS, '1' after 40ns, '1' after 50ns, '0' after 60ns, '1' after 70ns, '0' after 80ns, '1' after 100ns, '1' after 120ns; 
	clk <= not clk AFTER 5NS;
	clear <='1', '0' AFTER 20NS;

end test;

