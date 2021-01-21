library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.ALL;  
USE work.my_package.all;

ENTITY AND_qit_tb IS 
END AND_qit_tb;

ARCHITECTURE test OF AND_qit_tb IS

COMPONENT AND_qit
      PORT(in1,in2: IN QIT; 
	   out2: OUT QIT);
END COMPONENT;

FOR ALL: AND_qit USE ENTITY work.AND_qit(dataflow);

SIGNAL in1, in2, out2: QIT;
    
BEGIN

      N1: AND_qit port map(in1,in2,out2);

      in1 <= '0', '1' after 50ns, '0' after 100ns, '1' after 150ns, 'X' after 200ns, 'Z' after 300ns;
      in2 <= '0', '0' after 50ns, '1' after 100ns, '1' after 150ns, '1' after 200ns, '0' after 250ns, '1' after 300ns, '0' after 350ns, 'X' after 400ns, 'Z' after 450ns;

END TEST;

