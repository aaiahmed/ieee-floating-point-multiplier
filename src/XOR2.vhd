LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR2 IS
   PORT (--
        in1               : IN std_logic;
        in2                : IN std_logic;

	out2 		    : OUT std_logic

   );
END XOR2;

ARCHITECTURE struct OF XOR2 IS

-- At first add all the components with their portname
--write any signal if needed
-- bind/bind it at the cfg fil
--start the process

--xor2 needs 2 input and gates, and 2 input or gate

COMPONENT AND2
	PORT(in1, in2 : IN std_logic;
	     out2: OUT std_logic);
END COMPONENT;

COMPONENT OR2
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

FOR ALL: OR2 USE ENTITY WORK.OR2(dataflow);


--temp signal for the 4 branches
SIGNAL in1bar,in2bar, temp1, temp2: std_logic;

--start of process
BEGIN
   
   --combinational:
   --PROCESS (s0, s1)
   --BEGIN
	--get inverter selectors
 	C0: INV1 PORT MAP(in1, in1bar);
	C1: INV1 PORT MAP(in2, in2bar);

	--AND operation
	C2: AND2 PORT MAP(in1bar, in2, temp1);
	C3: AND2 PORT MAP(in1, in2bar, temp2);
	C4: OR2 PORT MAP(temp1, temp2, out2);




	
   --END PROCESS combinational;
END struct; 

