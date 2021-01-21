LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX25bit1sel IS
   PORT (--
         in0                : IN std_logic_vector(24 DOWNTO 0);
         in1                : IN std_logic_vector(24 DOWNTO 0);
	
         s0                : IN std_logic;

	 out25 		    : OUT std_logic_vector(24 DOWNTO 0)
   );
END MUX25bit1sel;

ARCHITECTURE behav OF MUX25bit1sel IS

-- At first add all the components with their portname
--write any signal if needed
-- bind/bind it at the cfg fil
--start the process

--mux4-1 needs 3 input and gates, not gate and 4 input or gate


--binding


--temp signal for the 4 branches
--SIGNAL b0, b1, s0bar: std_logic;
--SIGNAL  s00: std_logic:='0';

--start of process
BEGIN
--mux:
--PROCESS
--BEGIN
  
	out25<= in0 WHEN s0 = '0' else in1 WHEN  s0 = '1';

--   END PROCESS mux;
END behav; 


