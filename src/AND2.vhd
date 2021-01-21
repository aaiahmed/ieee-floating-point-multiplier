LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY AND2 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	
	 out2 		    : OUT std_logic
   );
END AND2;

ARCHITECTURE dataflow OF AND2 IS
PROCESS(in1, in2)
BEGIN
	out2 <=in1 and in2;
END PROCESS
END dataflow; 
