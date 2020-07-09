library ieee;
use ieee.std_logic_1164.all;

entity MUX_2 is
port(
sel: in std_logic_vector(2 downto 0);--Selector
f:OUT std_logic
);
end MUX_2;


architecture arqmain of MUX_2 is
begin
	  
	with sel select
	f <=  '1' when "000",
         '1' when "001",
         '0' when "010",
         '1' when "011",
			'1' when "100",
         '0' when "101",
         '0' when "110",
         '0' when "111",
			'0' when others;
end architecture arqmain;