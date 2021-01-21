LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NOR2 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	
	 out2 		    : OUT std_logic
   );
END NOR2;

ARCHITECTURE dataflow OF NOR2 IS

BEGIN
   

 	out2 <= not (in1 or in2) after 2ns;

END dataflow; 

