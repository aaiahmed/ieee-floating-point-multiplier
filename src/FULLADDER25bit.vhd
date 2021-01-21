


LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FULLADDER25bit IS
   PORT (--
         
	x	: IN std_logic_vector(24 DOWNTO 0);    
	y	: IN std_logic_vector(24 DOWNTO 0);
	cin	: IN std_logic;         
	sum     : OUT std_logic_vector(24 DOWNTO 0);
	cout    : OUT std_logic
   );
END FULLADDER25bit;

ARCHITECTURE struct OF FULLADDER25bit IS

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
SIGNAL nextCarry: std_logic_vector(25 DOWNTO 1);

--start the structure

BEGIN

	S0: FULLADDER1bit PORT MAP (x(0), y(0), cin, sum(0), nextCarry(1));
	S1: FULLADDER1bit PORT MAP (x(1), y(1), nextCarry(1), sum(1), nextCarry(2));
	S2: FULLADDER1bit PORT MAP (x(2), y(2), nextCarry(2), sum(2), nextCarry(3));
	S3: FULLADDER1bit PORT MAP (x(3), y(3), nextCarry(3), sum(3), nextCarry(4));
	S4: FULLADDER1bit PORT MAP (x(4), y(4), nextCarry(4), sum(4), nextCarry(5));
	S5: FULLADDER1bit PORT MAP (x(5), y(5), nextCarry(5), sum(5), nextCarry(6));
	S6: FULLADDER1bit PORT MAP (x(6), y(6), nextCarry(6), sum(6), nextCarry(7));	S7: FULLADDER1bit PORT MAP (x(7), y(7), nextCarry(7), sum(7), nextCarry(8));
	S8: FULLADDER1bit PORT MAP (x(8), y(8), nextCarry(8), sum(8), nextCarry(9));	S9: FULLADDER1bit PORT MAP (x(9), y(9), nextCarry(9), sum(9), nextCarry(10));
	S10: FULLADDER1bit PORT MAP (x(10), y(10), nextCarry(10), sum(10), nextCarry(11));
	S11: FULLADDER1bit PORT MAP (x(11), y(11), nextCarry(11), sum(11), nextCarry(12));
	S12: FULLADDER1bit PORT MAP (x(12), y(12), nextCarry(12), sum(12), nextCarry(13));
	S13: FULLADDER1bit PORT MAP (x(13), y(13), nextCarry(13), sum(13), nextCarry(14));
	S14: FULLADDER1bit PORT MAP (x(14), y(14), nextCarry(14), sum(14), nextCarry(15));
	S15: FULLADDER1bit PORT MAP (x(15), y(15), nextCarry(15), sum(15), nextCarry(16));
	S16: FULLADDER1bit PORT MAP (x(16), y(16), nextCarry(16), sum(16), nextCarry(17));	S17: FULLADDER1bit PORT MAP (x(17), y(17), nextCarry(17), sum(17), nextCarry(18));
	S18: FULLADDER1bit PORT MAP (x(18), y(18), nextCarry(18), sum(18), nextCarry(19));	S19: FULLADDER1bit PORT MAP (x(19), y(19), nextCarry(19), sum(19), nextCarry(20));

	S20: FULLADDER1bit PORT MAP (x(20), y(20), nextCarry(20), sum(20), nextCarry(21));
	S21: FULLADDER1bit PORT MAP (x(21), y(21), nextCarry(21), sum(21), nextCarry(22));
	S22: FULLADDER1bit PORT MAP (x(22), y(22), nextCarry(22), sum(22), nextCarry(23));
	S23: FULLADDER1bit PORT MAP (x(23), y(23), nextCarry(23), sum(23), nextCarry(24));
	S24: FULLADDER1bit PORT MAP (x(24), y(24), nextCarry(24), sum(24), nextCarry(25));
	
	S33: cout<=nextCarry(25);

END struct; 


