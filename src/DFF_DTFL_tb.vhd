

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY DFF_DTFL_tb is
END DFF_DTFL_tb;

ARCHITECTURE test OF DFF_DTFL_tb IS

SIGNAL d, clear,  q: std_logic;
SIGNAL clk : std_logic :='0';

COMPONENT DFF_DTFL
   PORT (
         d               : IN std_logic;
         clk               : IN std_logic;
         clear                : IN std_logic;

         --
	 q		             : OUT std_logic --no ; here
  );
END COMPONENT;


BEGIN
   chip: DFF_DTFL
         port map (d=>d, clk=>clk, clear=>clear,  q=>q);

   --d <= '0', '1' AFTER 20NS, '1' AFTER 40NS, '0' AFTER 60NS, '0' after 80ns, '1' after 100ns, '1' after 120ns, '0' after 140ns, '1' after 160NS, '0' after 200ns, '1' after 230ns, '0' after 240NS;
   d <= '0', '1' AFTER 100NS;   
   clk <= not clk AFTER 10 NS;  
   
  clear<= '0', '1' AFTER 110NS, '0' AFTER 140 NS;
--in2 <= '0', '0' AFTER 20NS, '0' AFTER 40NS, '0' AFTER 60NS, '1' after 80ns, '1' after 100ns, '0' after 120ns, '0' after 140ns;
--   in3 <= '0', '1' AFTER 20NS, '0' AFTER 40NS, '1' AFTER 60NS, '1' after 80ns, '1' after 100ns, '0' after 120ns, '0' after 140ns;
  

end test;
