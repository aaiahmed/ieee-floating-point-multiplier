

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY COUNTER_25 IS
   PORT (--
         clk                : IN std_logic;
         en                : IN std_logic;
	 clear             : IN std_logic; 

         q                : OUT std_logic_vector(4 DOWNTO 0);
	 over		  : OUT std_logic

   );
END COUNTER_25;

ARCHITECTURE struct OF COUNTER_25 IS

-- component declaration
COMPONENT XOR2
	PORT(in1, in2 : IN std_logic;
	     out2: OUT std_logic);
END COMPONENT;

COMPONENT AND2
	PORT(in1, in2 : IN std_logic;
	     out2: OUT std_logic);
END COMPONENT;

COMPONENT DFF_DTFL
   PORT (d               : IN std_logic;
        clk                : IN std_logic;
	clear		   : IN std_logic;
	q 		   : OUT std_logic);
END COMPONENT;

--component binding

FOR ALL: XOR2 USE ENTITY WORK.XOR2(struct);
FOR ALL: AND2 USE ENTITY WORK.AND2(dataflow);
FOR ALL: DFF_DTFL USE ENTITY WORK.DFF_DTFL(dataflow);

--signal declaration
SIGNAL a0, a1, a2, a3, a4, x0, x1, x2, x3, x4, qt0,qt1, qt2, qt3, qt4, qt5: std_logic;
SIGNAL clearC, overt: std_logic;
--start the structure

BEGIN
	
	C1: clearC <= clear OR overt;

	D1: XOR2 PORT MAP (En,qt0,x0);
	D2: XOR2 PORT MAP (qt1,a0,x1);
	D3: XOR2 PORT MAP (qt2,a1,x2);
	D4: XOR2 PORT MAP (qt3,a2,x3);
	D5: XOR2 PORT MAP (qt4,a3,x4);

	D6: AND2 PORT MAP (En,qt0,a0);
	D7: AND2 PORT MAP (qt1,a0,a1);
	D8: AND2 PORT MAP (qt2,a1,a2);
	D9: AND2 PORT MAP (qt3,a2,a3);
	D10: AND2 PORT MAP (qt4,a3,a4);

	D11: DFF_DTFL PORT MAP (x0,clk, clearC,qt0);
	D12: DFF_DTFL PORT MAP (x1,clk, clearC,qt1);
	D13: DFF_DTFL PORT MAP (x2,clk, clearC,qt2);
	D14: DFF_DTFL PORT MAP (x3,clk, clearC,qt3);
	D15: DFF_DTFL PORT MAP (x4,clk, clearC,qt4);

	D16: q(0)<=qt0;
	D17: q(1)<=qt1;
	D18: q(2)<=qt2;
	D19: q(3)<=qt3;
	D20: q(4)<=qt4;
	D21: overt<=qt4 and qt3 and (not qt2) and (not qt1) and qt0;
	D22: over<=overt;

END struct; 

