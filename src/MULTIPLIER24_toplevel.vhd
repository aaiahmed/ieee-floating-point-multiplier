LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MULTIPLIER24_toplevel IS
   PORT (--

        inA               : IN std_logic_vector(23 DOWNTO 0);
        inB               : IN std_logic_vector(23 DOWNTO 0);
	start		  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;

	output		  : OUT std_logic_vector(47 DOWNTO 0);
	done		  : OUT std_logic
   );
END MULTIPLIER24_toplevel;

ARCHITECTURE struct OF MULTIPLIER24_toplevel IS



--MULTIPLIER24_toplevel has a 5 bit counter, 3 32 bit shift register, 2 flip-flops, 32 bit adder, 32bit xor, MUL24_controller

COMPONENT XOR24 IS
   PORT (--

        in24               : IN std_logic_vector(23 DOWNTO 0);
	control2s	  : IN std_logic; -- control2s=1, 1's compliment, or what it is
        Out24               : OUT std_logic_vector(23 DOWNTO 0)

   );
END COMPONENT;

COMPONENT COUNTER_25 IS
   PORT (--
         clk                : IN std_logic;
         en                : IN std_logic;
	 clear             : IN std_logic; 

         q                : OUT std_logic_vector(4 DOWNTO 0);
	 over		  : OUT std_logic

   );
END COMPONENT;

COMPONENT SHIFT_24bit IS
   PORT (--
	hold		  : IN std_logic;
        sin               : IN std_logic;
        pin               : IN std_logic_vector(23 DOWNTO 0);
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qsout 		  : OUT std_logic; --serial out
	qpout		  : OUT std_logic_vector(23 DOWNTO 0)
   );
END COMPONENT;

COMPONENT DFF_DTFL IS
   PORT (--
         d                : IN std_logic;
         clk                : IN std_logic;
	 clear			: IN std_logic;	

	 q 		    : OUT std_logic
   );
END COMPONENT;

COMPONENT FULLADDER25bit IS
   PORT (--
         
	x	: IN std_logic_vector(24 DOWNTO 0);    
	y	: IN std_logic_vector(24 DOWNTO 0);
	cin	: IN std_logic;         
	sum     : OUT std_logic_vector(24 DOWNTO 0);
	cout    : OUT std_logic
   );
END COMPONENT;

COMPONENT MUL24_controller IS
   PORT(
	start		   : IN std_logic;
	a		   : IN std_logic_vector(1 DOWNTO 0);
	cnt_done	   : IN std_logic;
	clk		   : IN std_logic;
	clear		   : IN std_logic;

	done		   : OUT std_logic;
	control2s	   : OUT std_logic;
	hold24		   : OUT std_logic;
	hold25		   : OUT std_logic;
	holdX		   : OUT std_logic;
	ld_rshiftb	   : OUT std_logic;
	counter_en	   : OUT std_logic;
	counter_clear	   : OUT std_logic;
	muxout		   : OUT std_logic);
END COMPONENT;

COMPONENT AND5 IS
   PORT (--
         in1                : IN std_logic;
         in2                : IN std_logic;
	 in3		    : IN std_logic;
         in4                : IN std_logic;
	 in5		    : IN std_logic;	
	
	 out5 		    : OUT std_logic
   );
END COMPONENT;

COMPONENT MUX25bit1sel IS
   PORT (--
         in0                : IN std_logic_vector(24 DOWNTO 0);
         in1                : IN std_logic_vector(24 DOWNTO 0);
	
         s0                : IN std_logic;

	 out25 		    : OUT std_logic_vector(24 DOWNTO 0)
   );
END COMPONENT;

COMPONENT SHIFT_25bit IS
   PORT (--
	hold		  : IN std_logic;
        sin               : IN std_logic;
        pin               : IN std_logic_vector(24 DOWNTO 0);
	ld_shiftb	  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;
	qsout 		  : OUT std_logic; --serial out
	qpout		  : OUT std_logic_vector(24 DOWNTO 0)
   );
END COMPONENT;

COMPONENT MUX2to1 IS
   PORT (--
         in0                : IN std_logic;
         in1                : IN std_logic;
	
         s0                : IN std_logic;

	 out2to1 		    : OUT std_logic
   );
END COMPONENT;
--binding

FOR ALL: XOR24 USE ENTITY WORK.XOR24(struct);
FOR ALL: MUX2to1 USE ENTITY WORK.MUX2to1(struct);
FOR ALL: SHIFT_24bit USE ENTITY WORK.SHIFT_24bit(struct);
FOR ALL: MUL24_controller USE ENTITY WORK.MUL24_controller(behav);
FOR ALL: DFF_DTFL USE ENTITY WORK.DFF_DTFL(dataflow);
FOR ALL: FULLADDER25bit USE ENTITY WORK.FULLADDER25bit(struct);
FOR ALL: COUNTER_25 USE ENTITY WORK.COUNTER_25(struct);
FOR ALL: AND5 USE ENTITY WORK.AND5(dataflow);
FOR ALL: MUX25bit1sel USE ENTITY WORK.MUX25bit1sel(behav);

FOR ALL: SHIFT_25bit USE ENTITY WORK.SHIFT_25bit(struct);


--temp signal for the 4 branches
SIGNAL tempAllZeros : std_logic_vector(24 DOWNTO 0):="0000000000000000000000000";
SIGNAL tempP, tempB2, tempmAdder, tempXAdder, tempAdder: std_logic_vector(24 DOWNTO 0);--:="0000000000000000000000000";
SIGNAL tempA, tempB1 :std_logic_vector(23 DOWNTO 0);--:="000000000000000000000000";
SIGNAL temps1, temps2, temps3, temps4, temps7, tempC	: std_logic:='0';
SIGNAL hold24, hold25, holdX, ld_shiftb, counter_en, counter_clear, control2s, done_t, cnt_done, start_t, muxout  : std_logic:='0';
SIGNAL tempZero: std_logic := '0';
SIGNAL tempOne: std_logic :='1';
SIGNAL temps5: std_logic:='0';
SIGNAL counter_out: std_logic_vector(4 DOWNTO 0):="00000";
SIGNAL a: std_logic_vector(1 DOWNTO 0):="00";
SIGNAL clkb, cnt_done_i: std_logic;
SIGNAL temps11: std_logic;

--start of process
BEGIN

	C10: clkb<= NOT clk;	

	T11: SHIFT_25bit PORT MAP (hold25, tempP(23), tempmAdder(24 DOWNTO 0), ld_shiftb, clk, clear, temps1, tempP(24 DOWNTO 0));

	
	--P0: SHIFT_24bit PORT MAP (hold, temps4, tempmAdder(31 DOWNTO 0), ld_shiftb, clk, clear, temps1, tempP(31 DOWNTO 0));
	--P1: tempP(32)<= temps4;

	Q0: SHIFT_24bit PORT MAP (hold24, temps1, inA, ld_shiftb, clk, clear, temps2, tempA);
	
	Q3: MUX2to1 PORT MAP (temps2, tempZero, muxout, temps11);

	Q1: DFF_DTFL PORT MAP (temps11, clk, clear, temps3);

	A0: FULLADDER25bit PORT MAP (tempP, tempB2, control2s, tempAdder, tempC);
	--A1: DFF_DTFL PORT MAP (tempmAdder(32), clk, clear, temps4);

	X10: SHIFT_25bit PORT MAP (holdX, tempZero, tempAdder, ld_shiftb, clkb, clear, temps7, tempXAdder);

	N0: SHIFT_24bit PORT MAP (tempZero, tempZero, inB, tempOne, clk, clear, temps5, tempB1);
	N1: XOR24 PORT MAP (tempB1, control2s, tempB2(23 DOWNTO 0));
	N2: tempB2(24)<=tempB2(23);	

	Z0: COUNTER_25 PORT MAP (clk, counter_en, counter_clear, counter_out, cnt_done_i);

	--Z10: AND5 PORT MAP(counter_out(4),counter_out(3),counter_out(2),counter_out(1),counter_out(0), cnt_done);
	Z10: cnt_done <= cnt_done_i;

	C0: a(1)<=temps2;
	C1: a(0)<=temps3; 
	C2: MUL24_controller PORT MAP(start, a, cnt_done, clk, clear, done, control2s, hold24, hold25, holdX, ld_shiftb, counter_en, counter_clear, muxout);	

	--M1: tempmAdder<=tempAdder;
	M0: MUX25bit1sel PORT MAP (tempXAdder, tempAllZeros, muxout, tempmAdder);

	O0: output(23 DOWNTO 0)<= tempA;
	O1: output(47 DOWNTO 24)<= tempP(23 DOWNTO 0);
END struct; 






