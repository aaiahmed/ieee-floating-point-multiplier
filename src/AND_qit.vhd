library IEEE ;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE WORK.ALL;


PACKAGE my_package IS
  TYPE QIT IS ('0', '1', 'X', 'Z');
  FUNCTION "AND" (in1, in2: qit) RETURN qit;
END my_package;

PACKAGE BODY my_package IS

FUNCTION "AND" (in1, in2: qit) RETURN qit IS

TYPE qit_table IS array(QIT, QIT) OF QIT;

CONSTANT qit_and_table: qit_table :=
    (('0' ,'0' ,'0' ,'0'),
     ('0' ,'1' ,'X' ,'X'),
     ('0' ,'X' ,'X' ,'X'),
     ('0' ,'X' ,'X' ,'X'));

BEGIN

    RETURN qit_and_table(in1, in2);
  END "AND";

    
END my_package;

USE work.my_package.all;

ENTITY AND_qit is

    port(in1,in2: in QIT; out2: OUT QIT);

END AND_qit;
  
ARCHITECTURE dataflow of AND_qit is

BEGIN

    out2 <= in1 AND in2 after 2 ns;

END dataflow;

