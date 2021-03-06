
library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY AND2_tb is
END AND2_tb;

ARCHITECTURE test OF AND2_tb IS

SIGNAL in1, in2, out2: std_logic;

COMPONENT AND2
   PORT (
         in1                : IN std_logic;
         in2                : IN std_logic;
         --
	       out2		             : OUT std_logic --no ; here
  );
END COMPONENT;


BEGIN
   chip: AND2
         port map (in1=>in1, in2=>in2, out2=>out2);

   in1 <= '0', '1' AFTER 20NS, '0' AFTER 40NS, '1' AFTER 60NS, '0' after 80ns, '1' after 100ns;
   in2 <= '0', '0' AFTER 20NS, '1' AFTER 40NS, '1' AFTER 60NS, '1' after 80ns, '1' after 100ns;

end test;