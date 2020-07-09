	library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
port(
		x : in std_logic_vector(7 downto 0);
		y : in std_logic_vector(7 downto 0);
		ops: in std_logic_vector(4 downto 0);
		F : out std_logic_vector(7 downto 0));
end entity ALU;

architecture behavior of ALU is 
begin 
	with ops select 
	F <= "00" when "00000",
		x + y when "00001",
		x - y when "00010",
		x + 1 when "00011",
		x and y when "00100",
		x or y when "00101",
		x xor y when "00110",
		not x when "00111",
		x"00" when others;
end architecture behavior;
		