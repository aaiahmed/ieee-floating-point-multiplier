LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX4to1 IS
   PORT (--
         in0                : IN std_logic;
         in1                : IN std_logic;
         in2                : IN std_logic;
         in3                : IN std_logic;
	
         s0                : IN std_logic;
         s1                : IN std_logic;

	 out4to1 		    : OUT std_logic
   );
END MUX4to1;

ARCHITECTURE struct OF MUX4to1 IS

-- At first add all the components with their portname
--write any signal if needed
-- bind/bind it at the cfg fil
--start the process

--mux4-1 needs 3 input and gates, not gate and 4 input or gate

COMPONENT AND3
	PORT(in1, in2, in3 : IN std_logic;
	     out3: OUT std_logic);
END COMPONENT;

COMPONENT INV1
	PORT(in1 : IN std_logic;
	     out1: OUT std_logic);
END COMPONENT;

COMPONENT OR4
	PORT(in1, in2, in3, in4: IN std_logic;
	     out4: OUT std_logic);
END COMPONENT;

--binding


FOR ALL: INV1 USE ENTITY WORK.INV1(dataflow);

FOR ALL: OR4 USE ENTITY WORK.OR4(dataflow);

FOR ALL: AND3 USE ENTITY WORK.AND3(dataflow);


--temp signal for the 4 branches
SIGNAL b0, b1, b2, b3, s0bar,s1bar: std_logic;

--start of process
BEGIN
   
   --combinational:
   --PROCESS (s0, s1)
   --BEGIN
	--get inverter selectors
 	C0: INV1 PORT MAP(s0, s0bar);
	C1: INV1 PORT MAP(s1, s1bar);

	--AND operation
	C2: AND3 PORT MAP(s1bar, s0bar, in0, b0);
	C3: AND3 PORT MAP(s1bar, s0, in1, b1);
	C4: AND3 PORT MAP(s1, s0bar, in2, b2);
	C5: AND3 PORT MAP(s1, s0, in3, b3);
	
	--OR operation
	C6: OR4 PORT MAP(b0,b1,b2,b3,out4to1);

	--out4to1 <=(not(s0) and not(s1) and in0) or (s0 and not(s1) and in1) or (not(s0) and s1 and in2) or (s0 and s1 and in3) after 8ns; --problem
   --END PROCESS combinational;
END struct; 
