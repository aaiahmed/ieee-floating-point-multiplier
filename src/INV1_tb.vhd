library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY INV1_tb is
END INV1_tb;

ARCHITECTURE test OF INV1_tb IS

SIGNAL in1, out1: std_logic;

COMPONENT INV1
   PORT (
         in1               : IN std_logic;

         --
	 out1		             : OUT std_logic --no ; here
  );
END COMPONENT;


BEGIN
   chip: INV1
         port map (in1=>in1, out1=>out1);

   in1 <= '0', '1' AFTER 20NS, '0' AFTER 40NS, '1' AFTER 60NS, '0' after 80ns, '1' after 100ns;


end test;
