

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY COUNTER_5BIT_tb is
END COUNTER_5BIT_tb;

ARCHITECTURE test OF COUNTER_5BIT_tb IS

SIGNAL clk: std_logic :='0';
SIGNAL en, clear : std_logic;
SIGNAL q: std_logic_vector(4 DOWNTO 0);

COMPONENT COUNTER_5BIT
   PORT (
         clk                : IN std_logic;
         en                : IN std_logic;
	 clear             : IN std_logic; 

         q                : OUT std_logic_vector(4 DOWNTO 0)
  );
END COMPONENT;


BEGIN
   chip: COUNTER_5BIT
         port map (clk=>clk, en=>en, clear=> clear, q=>q);

	en <='1';
	clk <= not clk AFTER 10NS;
	clear <='1', '0' AFTER 20NS;

end test;
