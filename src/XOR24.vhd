LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR24 IS
   PORT (--

        in24               : IN std_logic_vector(23 DOWNTO 0);
	control2s	  : IN std_logic; -- control2s=1, 1's compliment, or what it is
        out24               : OUT std_logic_vector(23 DOWNTO 0)

   );
END XOR24;

ARCHITECTURE struct OF XOR24 IS


--XOR24 needs a 2 input and gate, an inverter, d-flop flop

COMPONENT XOR2 IS
   PORT (--
        in1               : IN std_logic;
        in2                : IN std_logic;

	out2 		    : OUT std_logic
   );
END COMPONENT;

--binding

FOR ALL: XOR2 USE ENTITY WORK.XOR2(struct);

--temp signal for the 4 branches
SIGNAL  otemp: std_logic_vector(23 DOWNTO 0);

--start of process
BEGIN
	
	N0: XOR2 PORT MAP(in24(0), control2s, otemp(0));
	N1: XOR2 PORT MAP(in24(1), control2s, otemp(1));	
	N2: XOR2 PORT MAP(in24(2), control2s, otemp(2));
	N3: XOR2 PORT MAP(in24(3), control2s, otemp(3));
	N4: XOR2 PORT MAP(in24(4), control2s, otemp(4));
	N5: XOR2 PORT MAP(in24(5), control2s, otemp(5));
	N6: XOR2 PORT MAP(in24(6), control2s, otemp(6));
	N7: XOR2 PORT MAP(in24(7), control2s, otemp(7));

	N8: XOR2 PORT MAP(in24(8), control2s, otemp(8));
	N9: XOR2 PORT MAP(in24(9), control2s, otemp(9));
	N10: XOR2 PORT MAP(in24(10), control2s, otemp(10));
	N11: XOR2 PORT MAP(in24(11), control2s, otemp(11));
	N12: XOR2 PORT MAP(in24(12), control2s, otemp(12));
	N13: XOR2 PORT MAP(in24(13), control2s, otemp(13));
	N14: XOR2 PORT MAP(in24(14), control2s, otemp(14));
	N15: XOR2 PORT MAP(in24(15), control2s, otemp(15));

	N16: XOR2 PORT MAP(in24(16), control2s, otemp(16));
	N17: XOR2 PORT MAP(in24(17), control2s, otemp(17));
	N18: XOR2 PORT MAP(in24(18), control2s, otemp(18));
	N19: XOR2 PORT MAP(in24(19), control2s, otemp(19));
	N20: XOR2 PORT MAP(in24(20), control2s, otemp(20));
	N21: XOR2 PORT MAP(in24(21), control2s, otemp(21));
	N22: XOR2 PORT MAP(in24(22), control2s, otemp(22));
	N23: XOR2 PORT MAP(in24(23), control2s, otemp(23));

	N34: out24<=otemp;

END struct; 





