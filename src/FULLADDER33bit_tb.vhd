



library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY FULLADDER33bit_tb is
END FULLADDER33bit_tb;

ARCHITECTURE test OF FULLADDER33bit_tb IS

SIGNAL xin,yin,sum: std_logic_vector(32 DOWNTO 0);
SIGNAL cin, cout: std_logic;

COMPONENT FULLADDER33bit
   PORT (
	x	: IN std_logic_vector(32 DOWNTO 0);    
	y	: IN std_logic_vector(32 DOWNTO 0);
	cin	: IN std_logic;         
	sum     : OUT std_logic_vector(32 DOWNTO 0);
	cout    : OUT std_logic
  );
END COMPONENT;


BEGIN
   chip: FULLADDER33bit
         port map (x=>xin, y=>yin, cin=> cin, sum=>sum, cout=>cout);

	xin <= "000000000000000000000000000000001", "100000000000000000000000000000000" after 50ns, "000000000000000100000000000000011" after 100ns, "000000000000000000000000000000111" after 150ns, "111111111111111111111111111111110" after 200ns;                                     
	yin <= "000000000000000000000000000000010", "100000000000000000000000000000000" after 50ns, "000000000000000100000000000000011" after 100ns, "000000000000000000000000000000111" after 150ns, "000000000000000000000000000000110" after 200ns;                                     
	cin <= '0', '1' after 50ns, '0' after 100ns, '1' after 150ns,'0' after 200ns ;

end test;
