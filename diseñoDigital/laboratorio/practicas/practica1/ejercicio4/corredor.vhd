library ieee;
use ieee.std_logic_1164.all;

entity corredor is port
(
a: in std_logic_vector (4 downto 0);
c: out std_logic);
end corredor;

architecture arquitec of corredor is
begin
with a select 
c <= '1' when "11000",
	'0' when "11100",
	'1' when "11110",
	'0' when "11111",
	'0' when others;
end arquitec;