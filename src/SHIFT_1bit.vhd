LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFT_1bit IS
   PORT (--
        hold		  : IN std_logic;
	sin               : IN std_logic;
        pin               : IN std_logic;
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qout 		  : OUT std_logic


   );
END SHIFT_1bit;

ARCHITECTURE struct OF SHIFT_1bit IS


--SHIFT_1bit needs a 2 input and gate, an inverter, d-flop flop

COMPONENT MUX2to1 IS
   PORT (--
         in0                : IN std_logic;
         in1                : IN std_logic;
	
         s0                : IN std_logic;

	 out2to1 		    : OUT std_logic
   );
END COMPONENT;




COMPONENT INV1
	PORT(in1: IN std_logic;
	     out1: OUT std_logic);
END COMPONENT;

COMPONENT DFF_DTFL
   PORT (d               : IN std_logic;
        clk                : IN std_logic;
	clear		   : IN std_logic;
	q 		   : OUT std_logic);
END COMPONENT;

--binding





FOR ALL: INV1 USE ENTITY WORK.INV1(dataflow);
FOR ALL: DFF_DTFL USE ENTITY WORK.DFF_DTFL(dataflow);
FOR ALL: MUX2to1 USE ENTITY WORK.MUX2to1(struct);




--temp signal for the 4 branches
SIGNAL  temp1, temp2, temp3, temp4, temp5, qtemp: std_logic;

--start of process
BEGIN
   

	N6: MUX2to1 PORT MAP(pin, qtemp, hold, temp5);	

	N0: temp1<= temp5 and ld_shiftb; 
	N4: INV1 PORT MAP(ld_shiftb, temp4);
	N2: temp2<= sin and temp4; 
	N1: temp3<= temp1 or temp2; 
	N3: DFF_DTFL PORT MAP (temp3, clk, clear, qtemp);

	qout<=qtemp;


END struct; 



