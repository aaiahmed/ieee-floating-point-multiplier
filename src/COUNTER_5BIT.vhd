

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY COUNTER_5BIT IS
   PORT (--
         clk                : IN std_logic;
         en                : IN std_logic;
	 clear             : IN std_logic; 

         q                : OUT std_logic_vector(4 DOWNTO 0);
	 over		  : OUT std_logic

   );
END COUNTER_5BIT;

ARCHITECTURE struct OF COUNTER_5BIT IS

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


FOR ALL: DFF_DTFL USE ENTITY WORK.DFF_DTFL(dataflow);

--signal declaration
SIGNAL a0, a1, a2, a3, a4, x0, x1, x2, x3, x4, qt0,qt1, qt2, qt3, qt4, qt5: std_logic;

--start the structure

BEGIN

	D1: x0<=En xor qt0; --XOR2 PORT MAP (En,qt0,x0);
	D2: x1<= qt1 xor a0; --XOR2 PORT MAP (qt1,a0,x1);
	D3: x2<= qt2 xor a1; --XOR2 PORT MAP (qt2,a1,x2);
	D4: x3<= qt3 xor a2; --XOR2 PORT MAP (qt3,a2,x3);
	D5: x4<= qt4 xor a3; --XOR2 PORT MAP (qt4,a3,x4);

	D6: a0<= En and qt0; --AND2 PORT MAP (En,qt0,a0);
	D7: a1<= qt1 and a0; --AND2 PORT MAP (qt1,a0,a1);
	D8: a2<= qt2 and a1; --AND2 PORT MAP (qt2,a1,a2);
	D9: a3<= qt3 and a2; --AND2 PORT MAP (qt3,a2,a3);
	D10: a4<= qt4 and a3; --AND2 PORT MAP (qt4,a3,a4);

	D11: DFF_DTFL PORT MAP (x0,clk, clear,qt0);
	D12: DFF_DTFL PORT MAP (x1,clk, clear,qt1);
	D13: DFF_DTFL PORT MAP (x2,clk, clear,qt2);
	D14: DFF_DTFL PORT MAP (x3,clk, clear,qt3);
	D15: DFF_DTFL PORT MAP (x4,clk, clear,qt4);

	D16: q(0)<=qt0;
	D17: q(1)<=qt1;
	D18: q(2)<=qt2;
	D19: q(3)<=qt3;
	D20: q(4)<=qt4;
	D21: over<=a4;

END struct; 

