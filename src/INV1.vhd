
LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY INV1 IS
   PORT (--
         in1                : IN std_logic;
	
	 out1 		    : OUT std_logic
   );
END INV1;

ARCHITECTURE dataflow OF INV1 IS

BEGIN


 	out1 <= NOT (in1) after 1ns;
END dataflow; 

