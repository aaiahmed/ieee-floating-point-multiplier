
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY MUL32_controller IS
   PORT(
	start		   : IN std_logic;
	a		   : IN std_logic_vector(1 DOWNTO 0);
	cnt_done	   : IN std_logic;
	clk		   : IN std_logic;
	clear		   : IN std_logic;

	done		   : OUT std_logic;
	control2s	   : OUT std_logic;
	hold32		   : OUT std_logic;
	hold33		   : OUT std_logic;
	holdX		   : OUT std_logic;
	ld_rshiftb	   : OUT std_logic;
	counter_en	   : OUT std_logic;
	counter_clear	   : OUT std_logic;
	muxout		   : OUT std_logic);

END MUL32_controller;

ARCHITECTURE behav OF MUL32_controller IS

	-- Define States of any State Machines Here
TYPE state_type IS (RESET, LOAD, DECIDE, ADD, SUB, RSHIFT, ENDMUL, DUMMY1, DUMMY2);

	-- Intermediate Signals
SIGNAL state, next_state            : state_type;

BEGIN


	-- Next State Decode
next_state_decode:
PROCESS (state, start, a, cnt_done)
BEGIN

CASE state IS

WHEN RESET =>
	IF(start = '1') THEN
		next_state <= LOAD;
	ELSE next_state <= RESET;
	END IF;
    
WHEN LOAD =>
	next_state <=DECIDE;

WHEN DECIDE =>
	IF(cnt_done = '1') THEN
		next_state <= ENDMUL;
	ELSIF(a = "00") THEN
		next_state <= RSHIFT;
	ELSIF(a = "01") THEN
		next_state <= ADD;
	ELSIF(a = "10") THEN
		next_state <= SUB;
	ELSIF(a = "11") THEN
		next_state <= RSHIFT;
	ELSE next_state <= DECIDE;
	END IF;

WHEN ADD =>
	next_state <= DUMMY1;

WHEN SUB =>
	next_state <= DUMMY1;

WHEN DUMMY1 =>
	next_state <= DUMMY2;

WHEN DUMMY2 =>
	next_state <= RSHIFT;

WHEN RSHIFT =>
	IF(cnt_done = '1') THEN
		next_state <= ENDMUL;
	ELSE next_state <= DECIDE;
	END IF;

WHEN ENDMUL =>
	IF (start = '1') THEN
		next_state <= LOAD;
	ELSE next_state <= ENDMUL;
	END IF;
	  
WHEN OTHERS =>
      next_state <= RESET;
END CASE;
END PROCESS next_state_decode;


	-- Clock state machine
clock_state_machine:
PROCESS (clear, clk)
BEGIN
	IF (clear = '1') THEN
		state    <= RESET;
  	ELSIF (clk'EVENT AND clk = '1') THEN
    		state    <= next_state;
  	END IF;
END PROCESS clock_state_machine;



	-- Generation of Combinatorial Control Signals 
combinational_logic:
PROCESS (state, next_state)
BEGIN   

	IF(state = ENDMUL) THEN
		done <= '1';
	ELSE done <= '0';
	END IF;

	IF(state = SUB) THEN
		control2s <= '1';
	ELSE control2s <= '0';
	END IF;

	IF(state = RESET OR state = LOAD Or state = DUMMY2) THEN
		hold33 <= '0';
	ELSE hold33 <= '1';
	END IF;

	IF(state = RESET OR state = LOAD) THEN
		hold32 <= '0';
	ELSE hold32 <= '1';
	END IF;

	IF (state = ADD OR state = SUB) THEN
		holdX <= '0';
	ELSe holdX <= '1';
	END IF;

	IF(state = RSHIFT) THEN
		ld_rshiftb <='0';
	ELSE ld_rshiftb <= '1';
	END IF;

	IF(state = RSHIFT) THEN
		counter_en <= '1';
	ELSE counter_en <= '0';
	END IF;

	IF(state = RESET OR state = LOAD) THEN
		counter_clear <= '1'; --active high clear of the flip flop
	ELSE counter_clear <= '0';
	END IF;

	IF(state = RESET OR state = LOAD) THEN
		muxout <= '1'; -- it will load all zeroes
	ELSE muxout <='0';
	END IF;

END PROCESS combinational_logic;

END behav;
