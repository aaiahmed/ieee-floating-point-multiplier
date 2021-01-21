
LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AND3 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	 in3		    : IN std_logic;
	
	 out3 		    : OUT std_logic
   );
END AND3;

ARCHITECTURE dataflow OF AND3 IS

BEGIN


 	out3 <=in1 and in2 and in3 after 3ns;
END dataflow; 
