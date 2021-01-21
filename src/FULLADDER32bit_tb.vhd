


library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE WORK.ALL;


ENTITY FULLADDER32bit_tb is
END FULLADDER32bit_tb;

ARCHITECTURE test OF FULLADDER32bit_tb IS

SIGNAL xin,yin,sum: std_logic_vector(31 DOWNTO 0);
SIGNAL cin, cout: std_logic;

COMPONENT FULLADDER32bit
   PORT (
	x	: IN std_logic_vector(31 DOWNTO 0);    
	y	: IN std_logic_vector(31 DOWNTO 0);
	cin	: IN std_logic;         
	sum     : OUT std_logic_vector(31 DOWNTO 0);
	cout    : OUT std_logic
  );
END COMPONENT;


BEGIN
   chip: FULLADDER32bit
         port map (x=>xin, y=>yin, cin=> cin, sum=>sum, cout=>cout);

	xin <= "00000000000000000000000000000001", "10000000000000000000000000000000" after 50ns, "00000000000000100000000000000011" after 100ns, "00000000000000000000000000000111" after 150ns ;                                     
	yin <= "00000000000000000000000000000010", "10000000000000000000000000000000" after 50ns, "00000000000000100000000000000011" after 100ns, "00000000000000000000000000000111" after 150ns;                                     
	cin <= '0', '1' after 50ns, '0' after 100ns, '0' after 150ns,'1' after 200ns ;

end test;
