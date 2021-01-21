LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.std_logic_1164.ALL;

ENTITY OR2 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	
	 out2 		    : OUT std_logic
   );
END OR2;

ARCHITECTURE dataflow OF OR2 IS
PROCESS(in1, in2)
BEGIN
   

 	out2 <=in1 or in2 after 2ns;
END PROCESS;
END dataflow; 

