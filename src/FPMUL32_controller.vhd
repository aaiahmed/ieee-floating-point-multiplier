
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;
USE IEEE.std_logic_unsigned.ALL;

ENTITY FPMUL32_controller IS
   PORT(

	mul_done	   : IN std_logic; -- it denotes when the multiplication done
	start		   : IN std_logic; -- it is the external start input
	clk		   : IN std_logic;
	clear		   : IN std_logic; -- external clear

	done		   : OUT std_logic; -- external done output
	mul_start	   : OUT std_logic; -- start of multiplication
	mul_clear	   : OUT std_logic -- the clear for the multiplier, used a diff to always clear at RESET state.
        );

END FPMUL32_controller;

ARCHITECTURE behav OF FPMUL32_controller IS

	-- Define States of any State Machines Here
TYPE state_type IS (RESET, BEGINFP, MUL, ADD, ENDFP);

	-- Intermediate Signals
SIGNAL state, next_state            : state_type;

BEGIN


	-- Next State Decode
next_state_decode:
PROCESS (state, start, mul_done)
BEGIN

CASE state IS

WHEN RESET =>
	IF(start = '1') THEN
		next_state <= BEGINFP;
	ELSE next_state <= RESET;
	END IF;
    
WHEN BEGINFP =>
	next_state <= MUL;

WHEN MUL =>
	IF(mul_done = '1') THEN
		next_state <= ADD;
	ELSE next_state <= MUL;
	END IF;

WHEN ADD =>
	next_state<= ENDFP;

WHEN ENDFP =>
	IF (start = '1') THEN
		next_state <= BEGINFP;
	ELSE next_state <= ENDFP;
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

	IF(state = RESET) THEN
		mul_clear <= '1';
	ELSE mul_clear <= '0';
	END If;

	IF(state = BEGINFP) THEN
		MUL_start <= '1';
	ELSE MUL_start<= '0';
	END IF;
	
	IF(state = ENDFP) THEN
		done <= '1';
	ELSE done <= '0';
	END IF;

END PROCESS combinational_logic;

END behav;
