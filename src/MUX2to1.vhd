LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX2to1 IS
   PORT (--
         in0                : IN std_logic;
         in1                : IN std_logic;
	
         s0                : IN std_logic;

	 out2to1 		    : OUT std_logic
   );
END MUX2to1;

ARCHITECTURE struct OF MUX2to1 IS

-- At first add all the components with their portname
--write any signal if needed
-- bind/bind it at the cfg fil
--start the process

--mux4-1 needs 3 input and gates, not gate and 4 input or gate


COMPONENT INV1
	PORT(in1 : IN std_logic;
	     out1: OUT std_logic);
END COMPONENT;


--binding


FOR ALL: INV1 USE ENTITY WORK.INV1(dataflow);


--temp signal for the 4 branches
SIGNAL b0, b1, s0bar: std_logic;

--start of process
BEGIN
   
 	C0: INV1 PORT MAP(s0, s0bar);

	--AND operation
	C1: b0<=in0 and s0bar; 
	C2: b1<=in1 and s0;

	--OR operation
	C3: out2to1<=b0 or b1;
   --END PROCESS combinational;
END struct; 

