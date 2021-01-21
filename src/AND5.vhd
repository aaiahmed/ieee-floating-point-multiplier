
LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AND5 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	 in3		    : IN std_logic;
         in4                : IN std_logic;
	 in5		    : IN std_logic;	
	
	 out5 		    : OUT std_logic
   );
END AND5;

ARCHITECTURE dataflow OF AND5 IS

BEGIN


 	out5 <=in1 and in2 and in3 and in4 and in5 after 5ns;
END dataflow; 

