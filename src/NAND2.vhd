LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY NAND2 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	
	 out2 		    : OUT std_logic
   );
END NAND2;

ARCHITECTURE dataflow OF NAND2 IS

BEGIN
	out2 <= not(in1 and in2) after 2ns;
END dataflow; 
