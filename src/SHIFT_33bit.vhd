LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY SHIFT_33bit IS
   PORT (--
	hold		  : IN std_logic;
        sin               : IN std_logic;
        pin               : IN std_logic_vector(32 DOWNTO 0);
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qsout 		  : OUT std_logic; --serial out
	qpout		  : OUT std_logic_vector(32 DOWNTO 0)
   );
END SHIFT_33bit;

ARCHITECTURE struct OF SHIFT_33bit IS


--SHIFT_33bit needs a 2 input and gate, an inverter, d-flop flop

COMPONENT SHIFT_1bit
   PORT (
        hold		  : IN std_logic;
        sin               : IN std_logic;
        pin               : IN std_logic;
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qout 		  : OUT std_logic
  );
END COMPONENT;

--binding

FOR ALL: SHIFT_1bit USE ENTITY WORK.SHIFT_1bit(struct);

--temp signal for the 4 branches
SIGNAL  qptemp: std_logic_vector(0 TO 32);
--qpin has MSB at 31
--just qptemp has them opposite, having MSB at 0

--start of process
BEGIN
--sin, pin, ld_shiftb, clk, clear, qout
	N0: SHIFT_1bit PORT MAP(hold, sin, pin(32), ld_shiftb, clk, clear, qptemp(0));
	N1: SHIFT_1bit PORT MAP(hold, qptemp(0), pin(31), ld_shiftb, clk, clear, qptemp(1));
	N2: SHIFT_1bit PORT MAP(hold, qptemp(1), pin(30), ld_shiftb, clk, clear, qptemp(2));
	N3: SHIFT_1bit PORT MAP(hold, qptemp(2), pin(29), ld_shiftb, clk, clear, qptemp(3));
	N4: SHIFT_1bit PORT MAP(hold, qptemp(3), pin(28), ld_shiftb, clk, clear, qptemp(4));
	N5: SHIFT_1bit PORT MAP(hold, qptemp(4), pin(27), ld_shiftb, clk, clear, qptemp(5));
	N6: SHIFT_1bit PORT MAP(hold, qptemp(5), pin(26), ld_shiftb, clk, clear, qptemp(6));
	N7: SHIFT_1bit PORT MAP(hold, qptemp(6), pin(25), ld_shiftb, clk, clear, qptemp(7));

	N8: SHIFT_1bit PORT MAP(hold, qptemp(7), pin(24), ld_shiftb, clk, clear, qptemp(8));
	N9: SHIFT_1bit PORT MAP(hold, qptemp(8), pin(23), ld_shiftb, clk, clear, qptemp(9));
	N10: SHIFT_1bit PORT MAP(hold, qptemp(9), pin(22), ld_shiftb, clk, clear, qptemp(10));
	N11: SHIFT_1bit PORT MAP(hold, qptemp(10), pin(21), ld_shiftb, clk, clear, qptemp(11));
	N12: SHIFT_1bit PORT MAP(hold, qptemp(11), pin(20), ld_shiftb, clk, clear, qptemp(12));
	N13: SHIFT_1bit PORT MAP(hold, qptemp(12), pin(19), ld_shiftb, clk, clear, qptemp(13));
	N14: SHIFT_1bit PORT MAP(hold, qptemp(13), pin(18), ld_shiftb, clk, clear, qptemp(14));
	N15: SHIFT_1bit PORT MAP(hold, qptemp(14), pin(17), ld_shiftb, clk, clear, qptemp(15));

	N16: SHIFT_1bit PORT MAP(hold, qptemp(15), pin(16), ld_shiftb, clk, clear, qptemp(16));
	N17: SHIFT_1bit PORT MAP(hold, qptemp(16), pin(15), ld_shiftb, clk, clear, qptemp(17));
	N18: SHIFT_1bit PORT MAP(hold, qptemp(17), pin(14), ld_shiftb, clk, clear, qptemp(18));
	N19: SHIFT_1bit PORT MAP(hold, qptemp(18), pin(13), ld_shiftb, clk, clear, qptemp(19));
	N20: SHIFT_1bit PORT MAP(hold, qptemp(19), pin(12), ld_shiftb, clk, clear, qptemp(20));
	N21: SHIFT_1bit PORT MAP(hold, qptemp(20), pin(11), ld_shiftb, clk, clear, qptemp(21));
	N22: SHIFT_1bit PORT MAP(hold, qptemp(21), pin(10), ld_shiftb, clk, clear, qptemp(22));
	N23: SHIFT_1bit PORT MAP(hold, qptemp(22), pin(9), ld_shiftb, clk, clear, qptemp(23));

	N24: SHIFT_1bit PORT MAP(hold, qptemp(23), pin(8), ld_shiftb, clk, clear, qptemp(24));	
	N25: SHIFT_1bit PORT MAP(hold, qptemp(24), pin(7), ld_shiftb, clk, clear, qptemp(25));
	N26: SHIFT_1bit PORT MAP(hold, qptemp(25), pin(6), ld_shiftb, clk, clear, qptemp(26));
	N27: SHIFT_1bit PORT MAP(hold, qptemp(26), pin(5), ld_shiftb, clk, clear, qptemp(27));
	N28: SHIFT_1bit PORT MAP(hold, qptemp(27), pin(4), ld_shiftb, clk, clear, qptemp(28));
	N29: SHIFT_1bit PORT MAP(hold, qptemp(28), pin(3), ld_shiftb, clk, clear, qptemp(29));
	N30: SHIFT_1bit PORT MAP(hold, qptemp(29), pin(2), ld_shiftb, clk, clear, qptemp(30));
	N31: SHIFT_1bit PORT MAP(hold, qptemp(30), pin(1), ld_shiftb, clk, clear, qptemp(31));
        N32: SHIFT_1bit PORT MAP(hold, qptemp(31), pin(0), ld_shiftb, clk, clear, qptemp(32));

	N33: qsout<=qptemp(32);
	N34: qpout<=qptemp;

END struct; 





