
LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY OR3 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	 in3                : IN std_logic;
	
	 out3 		    : OUT std_logic
   );
END OR3;

ARCHITECTURE dataflow OF OR3 IS

BEGIN
   

 	out3 <=in1 or in2 or in3 after 4ns;

END dataflow; 
