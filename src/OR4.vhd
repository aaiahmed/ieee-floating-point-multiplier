
LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR4 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	 in3                : IN std_logic;
	 in4                : IN std_logic;
	
	 out4 		    : OUT std_logic
   );
END OR4;

ARCHITECTURE dataflow OF OR4 IS

BEGIN
   

 	out4 <=in1 or in2 or in3 or in4 after 4ns;

END dataflow; 
