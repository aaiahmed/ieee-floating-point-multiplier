LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FULLADDER1bit IS
   PORT (--
        xin               : IN std_logic;
        yin                : IN std_logic;
	cin		   : IN std_logic;
	sumout 		    : OUT std_logic;
	Carryout	    : OUT std_logic

   );
END FULLADDER1bit;

ARCHITECTURE struct OF FULLADDER1bit IS

	-- At first add all the components with their portname
	--write any signal if needed
	-- bind/bind it at the cfg fil
	--start the process

	--FULLADDER1bit needs 2 input and gates, and 2 input xor gate


	--binding



	--temp signal for the 4 branches
SIGNAL xinbar,yinbar, temp1, temp2, temp3: std_logic;

	--start of process
BEGIN  
	C0: temp2<= xin and yin;
	C1: temp1<= xin xor yin;
	C3: temp3<= temp1 and cin;
	C4: sumout<= temp1 xor cin;
	C5: carryout<= temp3 or temp2;
	
END struct; 


