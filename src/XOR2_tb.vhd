library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY XOR2_tb is
END XOR2_tb;

ARCHITECTURE test OF XOR2_tb IS

SIGNAL in1, in2, out2: std_logic;

COMPONENT XOR2
   PORT (
         in1                : IN std_logic;
         in2                : IN std_logic;

         --

	 out2		             : OUT std_logic


  );
END COMPONENT;


BEGIN
   chip: XOR2
         port map (in1=>in1, in2=>in2, out2=>out2);

   in1 <= '0', '1' AFTER 40NS, '0' AFTER 80NS, '1' AFTER 120NS, '1' after 160ns, '1' after 200ns;
   in2 <= '0', '0' AFTER 40NS, '1' AFTER 80NS, '1' AFTER 120NS, '0' after 160ns, '1' after 200ns;


end test;

