LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DFF_DTFL IS
   PORT (--
         d                : IN std_logic;
         clk                : IN std_logic;
	 clear			: IN std_logic;	

	 q 		    : OUT std_logic
   );
END DFF_DTFL;

ARCHITECTURE dataflow OF DFF_DTFL IS

BEGIN
process(clk, clear)
begin
  if clear = '1' then
    q <= '0';
  elsif rising_edge(clk) then
    q <= d;
  end if;
end process;

---D1: BLOCK(clear/='1')
--BEGIN
--	q<='0';
--END BLOCK D1;
	


END dataflow; 
