
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity counter_top is

port(
	clk: in std_logic;
	rst_n: in std_logic;
	
	led: out std_logic_vector(3 downto 0)
	);
end entity counter_top;

architecture rtl of counter_top is

signal cnt: std_logic_vector(23 downto 0);
signal led_buf: std_logic_vector(3 downto 0);

begin

p_cnt: process(clk, rst_n)
begin
	if(rst_n='0') then
		cnt<=(others=>'0');
	elsif (rising_edge(clk)) then
		cnt<=cnt+1;
	end if;
end process p_cnt;

p_led: process(clk, rst_n)
begin
	if(rst_n='0') then
	led_buf<="1110";
	elsif (rising_edge(clk)) then
		if(cnt=x"000001") then
			led_buf<=led_buf(2 downto 0) & led_buf(3);
		end if;
	end if;
end process p_led;

led<=led_buf;
end architecture rtl;
