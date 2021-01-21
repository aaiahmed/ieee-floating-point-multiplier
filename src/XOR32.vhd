LIBRARY IEEE;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY XOR32 IS
   PORT (--

        in32               : IN std_logic_vector(31 DOWNTO 0);
	control2s	  : IN std_logic; -- control2s=1, 1's compliment, or what it is
        out32               : OUT std_logic_vector(31 DOWNTO 0)

   );
END XOR32;

ARCHITECTURE struct OF XOR32 IS


--XOR32 needs a 2 input and gate, an inverter, d-flop flop





--temp signal for the 4 branches
SIGNAL  otemp: std_logic_vector(31 DOWNTO 0);

--start of process
BEGIN
	
	S0: otemp(0)<= in32(0) xor control2s;
	S1: otemp(1)<= in32(1) xor control2s;
	S2: otemp(2)<= in32(2) xor control2s;
	S3: otemp(3)<= in32(3) xor control2s;
	S4: otemp(4)<= in32(4) xor control2s;
	S5: otemp(5)<= in32(5) xor control2s;
	S6: otemp(6)<= in32(6) xor control2s;
	S7: otemp(7)<= in32(7) xor control2s;
	
	S8: otemp(8)<= in32(8) xor control2s;
	S9: otemp(9)<= in32(9) xor control2s;
	S10: otemp(10)<= in32(10) xor control2s;
	S11: otemp(11)<= in32(11) xor control2s;
	S12: otemp(12)<= in32(12) xor control2s;
	S13: otemp(13)<= in32(13) xor control2s;
	S14: otemp(14)<= in32(14) xor control2s;
	S15: otemp(15)<= in32(15) xor control2s;

	S16: otemp(16)<= in32(16) xor control2s;
	S17: otemp(17)<= in32(17) xor control2s;
	S18: otemp(18)<= in32(18) xor control2s;
	S19: otemp(19)<= in32(19) xor control2s;
	S20: otemp(20)<= in32(20) xor control2s;
	S21: otemp(21)<= in32(21) xor control2s;
	S22: otemp(22)<= in32(22) xor control2s;
	S23: otemp(23)<= in32(23) xor control2s;

	S24: otemp(24)<= in32(24) xor control2s;
	S25: otemp(25)<= in32(25) xor control2s;
	S26: otemp(26)<= in32(26) xor control2s;
	S27: otemp(27)<= in32(27) xor control2s;
	S28: otemp(28)<= in32(28) xor control2s;
	S29: otemp(29)<= in32(29) xor control2s;
	S30: otemp(30)<= in32(30) xor control2s;
	S31: otemp(31)<= in32(31) xor control2s;	

	N32: out32<=otemp;

END struct; 





