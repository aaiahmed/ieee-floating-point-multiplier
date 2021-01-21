

LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FULLADDER8bit IS
   PORT (--
         
	x	: IN std_logic_vector(7 DOWNTO 0);    
	y	: IN std_logic_vector(7 DOWNTO 0);
	cin	: IN std_logic;         
	sum     : OUT std_logic_vector(7 DOWNTO 0);
	cout    : OUT std_logic
   );
END FULLADDER8bit;

ARCHITECTURE struct OF FULLADDER8bit IS

-- component declaration

COMPONENT FULLADDER1bit IS
   PORT (--
        xin               : IN std_logic;
        yin                : IN std_logic;
	cin		   : IN std_logic;
	sumout 		    : OUT std_logic;
	Carryout	    : OUT std_logic);
END COMPONENT;


--component binding

FOR ALL: FULLADDER1bit USE ENTITY WORK.FULLADDER1bit(struct);

--signal declaration
SIGNAL nextCarry: std_logic_vector(8 DOWNTO 1);

--start the structure

BEGIN

	S0: FULLADDER1bit PORT MAP (x(0), y(0), cin, sum(0), nextCarry(1));
	S1: FULLADDER1bit PORT MAP (x(1), y(1), nextCarry(1), sum(1), nextCarry(2));
	S2: FULLADDER1bit PORT MAP (x(2), y(2), nextCarry(2), sum(2), nextCarry(3));
	S3: FULLADDER1bit PORT MAP (x(3), y(3), nextCarry(3), sum(3), nextCarry(4));
	S4: FULLADDER1bit PORT MAP (x(4), y(4), nextCarry(4), sum(4), nextCarry(5));
	S5: FULLADDER1bit PORT MAP (x(5), y(5), nextCarry(5), sum(5), nextCarry(6));
	S6: FULLADDER1bit PORT MAP (x(6), y(6), nextCarry(6), sum(6), nextCarry(7));	S7: FULLADDER1bit PORT MAP (x(7), y(7), nextCarry(7), sum(7), nextCarry(8));

	S32: cout<=nextCarry(8);

END struct; 


