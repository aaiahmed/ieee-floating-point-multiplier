
LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY DFF_STRUCT IS
   PORT (--
        d               : IN std_logic;
        clk                : IN std_logic;
	clear		   : IN std_logic;
	q 		   : OUT std_logic
	--qb	    : OUT std_logic

   );
END DFF_STRUCT;

ARCHITECTURE struct OF DFF_STRUCT IS

-- At first add all the components with their portname
--write any signal if needed
-- bind/bind it at the cfg fil
--start the process

--DFF_STRUCT needs 2 input nand gates, and 3 input nand gates

COMPONENT NAND2
	PORT(in1, in2 : IN std_logic;
	     out2: OUT std_logic);
END COMPONENT;

COMPONENT NAND3
	PORT(in1, in2, in3 : IN std_logic;
	     out3: OUT std_logic);
END COMPONENT;


--COMPONENT INV1
--	PORT(in1 : IN std_logic;
--	     out1: OUT std_logic);
--END COMPONENT;



--binding




FOR ALL: NAND2 USE ENTITY WORK.NAND2(dataflow);
FOR ALL: NAND3 USE ENTITY WORK.NAND3(dataflow);
--FOR ALL: INV1 USE ENTITY WORK.INV1(dataflow);



--temp signal for the 4 branches
SIGNAL  temp1, temp2, temp3, temp4,qtemp, qb: std_logic;

--start of process
BEGIN
   
   --combinational:
   --PROCESS (s0, s1)
   --BEGIN

--	N0: INV1(clear, clearb);
	N1: NAND3 PORT MAP(clear, d, temp2, temp1);
	N2: NAND3 PORT MAP(temp1, clk, temp3, temp2);
	N3: NAND3 PORT MAP(clk, clear, temp4, temp3);
	N4: NAND2 PORT MAP(temp1, temp3, temp4);
  
	N5: NAND3 PORT MAP(clear, temp2,qtemp, qb);
	N6: NAND2 PORT MAP(temp3, qb, qtemp);
	q<=qtemp;	
	
   --END PROCESS combinational;
END struct; 


