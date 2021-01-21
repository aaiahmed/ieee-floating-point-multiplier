LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DECODER2to4 IS
   PORT (--
        s0                : IN std_logic;
        s1                : IN std_logic;

	out0 		    : OUT std_logic;
	out1 		    : OUT std_logic;
	out2 		    : OUT std_logic;
	out3 		    : OUT std_logic
   );
END DECODER2to4;

ARCHITECTURE struct OF DECODER2to4 IS

-- At first add all the components with their portname
--write any signal if needed
-- bind/bind it at the cfg fil
--start the process

--dec 2-4 needs 2 input and gates, inv1

COMPONENT AND2
	PORT(in1, in2 : IN std_logic;
	     out2: OUT std_logic);
END COMPONENT;

COMPONENT INV1
	PORT(in1 : IN std_logic;
	     out1: OUT std_logic);
END COMPONENT;



--binding


FOR ALL: INV1 USE ENTITY WORK.INV1(dataflow);



FOR ALL: AND2 USE ENTITY WORK.AND2(dataflow);


--temp signal for the 4 branches
SIGNAL s0bar,s1bar: std_logic;

--start of process
BEGIN
   
   --combinational:
   --PROCESS (s0, s1)
   --BEGIN
	--get inverter selectors
 	C0: INV1 PORT MAP(s0, s0bar);
	C1: INV1 PORT MAP(s1, s1bar);

	--AND operation
	C2: AND2 PORT MAP(s0bar, s1bar, out0);
	C3: AND2 PORT MAP(s0, s1bar, out1);
	C4: AND2 PORT MAP(s0bar, s1, out2);
	C5: AND2 PORT MAP(s0, s1, out3);



	
   --END PROCESS combinational;
END struct; 

