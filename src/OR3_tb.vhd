

library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY OR3_tb is
END OR3_tb;

ARCHITECTURE test OF OR3_tb IS

SIGNAL in1, in2, in3,  out3: std_logic;

COMPONENT OR3
   PORT (
         in1                : IN std_logic;
         in2                : IN std_logic;
         in3                : IN std_logic;

         --
	 out3		             : OUT std_logic --no ; here
  );
END COMPONENT;


BEGIN
   chip: OR3
         port map (in1=>in1, in2=>in2, in3=>in3,  out3=>out3);

   in1 <= '0', '1' AFTER 20NS, '0' AFTER 40NS, '1' AFTER 60NS, '0' after 80ns, '1' after 100ns, '0' after 120ns, '0' after 140ns;
   in2 <= '0', '0' AFTER 20NS, '0' AFTER 40NS, '0' AFTER 60NS, '1' after 80ns, '1' after 100ns, '0' after 120ns, '0' after 140ns;
   in3 <= '0', '1' AFTER 20NS, '0' AFTER 40NS, '1' AFTER 60NS, '1' after 80ns, '1' after 100ns, '0' after 120ns, '0' after 140ns;
  

end test;