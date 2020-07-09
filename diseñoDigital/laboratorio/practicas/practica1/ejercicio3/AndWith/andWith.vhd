library ieee;
use ieee.std_logic_1164.all;

entity andWith is 
port(
a: in std_logic_vector(1 downto 0);
c: out std_logic);
end andWith;

architecture arqandWith of andWith is
begin 
with a select
c<= '1' when "11",
	'0' when others;
end arqandwith;