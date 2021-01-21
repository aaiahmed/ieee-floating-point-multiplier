
library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY FULLADDER1bit_tb is
END FULLADDER1bit_tb;

ARCHITECTURE test OF FULLADDER1bit_tb IS

SIGNAL xin, yin, cin, sumout, carryout: std_logic;

COMPONENT FULLADDER1bit
   PORT (
         xin                : IN std_logic;
         yin                : IN std_logic;
         cin                : IN std_logic;
         --
	 sumout		             : OUT std_logic;
	 carryout	             : OUT std_logic
  );
END COMPONENT;

BEGIN
   chip: FULLADDER1bit
         port map (sumout=>sumout, carryout=>carryout, xin=>xin, yin=>yin, cin=>cin);

   xin <= '0', '1' AFTER 40NS, '0' AFTER 80NS, '1' AFTER 120NS, '0' after 160ns, '1' after 200ns, '1' after 240ns;
   yin <= '0', '0' AFTER 40NS, '1' AFTER 80NS, '1' AFTER 120NS, '0' after 160ns, '0' after 200ns, '1' after 240ns;
   cin <= '0', '0' AFTER 40NS, '0' AFTER 80NS, '0' AFTER 120NS, '1' after 160ns, '1' after 200ns, '1' after 240ns;
end test;

