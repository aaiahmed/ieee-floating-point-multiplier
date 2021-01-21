

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFTREG_RIGHT_4BIT IS
   PORT (--
	 d                  : IN std_logic;
         clk                : IN std_logic;
	 clear             : IN std_logic; 
         q                : OUT std_logic_vector(3 DOWNTO 0)

   );
END SHIFTREG_RIGHT_4BIT;

ARCHITECTURE struct OF SHIFTREG_RIGHT_4BIT IS

-- component declaration
COMPONENT DFF_DTFL
   PORT (d               : IN std_logic;
        clk                : IN std_logic;
	clear		   : IN std_logic;
	q 		   : OUT std_logic);
END COMPONENT;

--component binding

FOR ALL: DFF_DTFL USE ENTITY WORK.DFF_DTFL(dataflow);

--signal declaration
SIGNAL qt0,qt1, qt2, qt3, qt4: std_logic;

--start the structure

BEGIN
	D1: DFF_DTFL PORT MAP (d,clk, clear,qt0);
	D2: DFF_DTFL PORT MAP (qt0,clk, clear,qt1);
	D3: DFF_DTFL PORT MAP (qt1,clk, clear,qt2);
	D4: DFF_DTFL PORT MAP (qt2,clk, clear,qt3);

	D5: q(0)<=qt3;
	D6: q(1)<=qt2;
	D7: q(2)<=qt1;
	D8: q(3)<=qt0;
END struct; 


