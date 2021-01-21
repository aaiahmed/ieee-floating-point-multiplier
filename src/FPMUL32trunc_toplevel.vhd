LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY FPMUL32trunc_toplevel IS
   PORT (--

        inA               : IN std_logic_vector(31 DOWNTO 0); -- 31+(30-23)+(22-0)
        inB               : IN std_logic_vector(31 DOWNTO 0);
	start		  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;

	output		  : OUT std_logic_vector(31 DOWNTO 0);-- 54+(53-46)+(45-0)
	done		  : OUT std_logic
   );
END FPMUL32trunc_toplevel;

ARCHITECTURE struct OF FPMUL32trunc_toplevel IS



--FPMUL32trunc_toplevel has a 5 bit counter, 3 32 bit shift register, 2 flip-flops, 32 bit adder, 32bit xor, MUL24_controller

COMPONENT MULTIPLIER32_toplevel IS
   PORT (--

        inA               : IN std_logic_vector(31 DOWNTO 0);
        inB               : IN std_logic_vector(31 DOWNTO 0);
	start		  : IN std_logic;
	clk		  : IN std_logic;
	clear		  : IN std_logic;

	output		  : OUT std_logic_vector(63 DOWNTO 0);
	done		  : OUT std_logic
   );
END COMPONENT;

COMPONENT FPMUL32_controller IS
   PORT(

	mul_done	   : IN std_logic; -- it denotes when the multiplication done
	start		   : IN std_logic; -- it is the external start input
	clk		   : IN std_logic;
	clear		   : IN std_logic; -- external clear

	done		   : OUT std_logic; -- external done output
	mul_start	   : OUT std_logic; -- start of multiplication
	mul_clear	   : OUT std_logic -- the clear for the multiplier, used a diff to always clear at RESET state.
        );

END COMPONENT;

COMPONENT MUX46bit1sel IS
   PORT (--
         in0                : IN std_logic_vector(45 DOWNTO 0);
         in1                : IN std_logic_vector(45 DOWNTO 0);
	
         s0                : IN std_logic;

	 out46 		    : OUT std_logic_vector(45 DOWNTO 0)
   );
END COMPONENT;

COMPONENT FULLADDER8bit IS
   PORT (--
         
	x	: IN std_logic_vector(7 DOWNTO 0);    
	y	: IN std_logic_vector(7 DOWNTO 0);
	cin	: IN std_logic;         
	sum     : OUT std_logic_vector(7 DOWNTO 0);
	cout    : OUT std_logic
   );
END COMPONENT;

--binding

FOR ALL: MULTIPLIER32_toplevel USE ENTITY WORK.MULTIPLIER32_toplevel(struct);
FOR ALL: FPMUL32_controller USE ENTITY WORK.FPMUL32_controller(behav);
FOR ALL: MUX46bit1sel USE ENTITY WORK.MUX46bit1sel(behav);
FOR ALL: FULLADDER8bit USE ENTITY WORK.FULLADDER8bit(struct);


--temp signal for the 4 branches

SIGNAL tempOut: std_logic_vector(63 DOWNTO 0);
SIGNAL tempA1: std_logic_vector(7 DOWNTO 0);
SIGNAL tempSub: std_logic_vector(7 DOWNTO 0):="10000000";
SIGNAL mul_done, start_i, done_i, mul_start, mul_clear: std_logic;
SIGNAL tempinA: std_logic_vector(31 DOWNTO 0);
SIGNAL tempinB: std_logic_vector(31 DOWNTO 0);
SIGNAL couttemp1, couttemp2: std_logic;
SIGNAL tempOne: std_logic:='1';
SIGNAL tempMul: std_logic_vector(45 DOWNTO 0);
SIGNAL clear_i:std_logic;



--start of process
BEGIN

	Z123: clear_i<=not clear;
	Z124: start_i<=not start;
	
	A1: tempinA(31 DOWNTO 24)<= x"00";
	A2: tempinB(31 DOWNTO 24)<= x"00";
	P1: tempinA(22 DOWNTO 0)<= inA(22 DOWNTO 0);
	P2: tempinA(23)<= '1';

	Q1: tempinB(22 DOWNTO 0)<= inB(22 DOWNTO 0);
	Q2: tempinB(23)<= '1';

	M1: MULTIPLIER32_toplevel PORT MAP(tempinA, tempinB, mul_start, clk, clear_i, tempOut, mul_done);

	C1: FPMUL32_controller PORT MAP(mul_done, start_i, clk, clear_i, done_i, mul_start, mul_clear);

	MX1: MUX46bit1sel PORT MAP(tempOut(45 DOWNTO 0), tempOut(46 DOWNTO 1), tempOut(47), tempMul(45 DOWNTO 0));
	MX2: output(22 DOWNTO 0)<=tempMul(45 DOWNTO 23);

	AD1: FULLADDER8bit PORT MAP(inA(30 DOWNTO 23), inB(30 DOWNTO 23), tempOut(47), tempA1, couttemp1);
	AD2: FULLADDER8bit PORT MAP(tempA1, tempSub, tempOne, output(30 DOWNTO 23), couttemp2);

	S1: output(31)<= inA(31) xor inB (31);
	D23: done<= not done_i;

END struct; 






