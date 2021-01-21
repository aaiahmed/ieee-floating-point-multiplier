library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY DECODER2to4_tb is
END DECODER2to4_tb;

ARCHITECTURE test OF DECODER2to4_tb IS

SIGNAL s0, s1, out0, out1, out2, out3: std_logic;

COMPONENT DECODER2to4
   PORT (
         s0                : IN std_logic;
         s1                : IN std_logic;

         --
	 out0		             : OUT std_logic;
	 out1		             : OUT std_logic;
	 out2		             : OUT std_logic;
	 out3		             : OUT std_logic

  );
END COMPONENT;


BEGIN
   chip: DECODER2to4
         port map (s0=>s0, s1=>s1, out0=>out0, out1=>out1, out2=>out2, out3=>out3);

   s0 <= '0', '1' AFTER 40NS, '0' AFTER 80NS, '1' AFTER 120NS, '0' after 160ns, '1' after 200ns;
   s1 <= '0', '0' AFTER 40NS, '1' AFTER 80NS, '1' AFTER 120NS, '1' after 160ns, '1' after 200ns;


end test;
