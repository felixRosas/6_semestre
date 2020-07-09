library ieee;
use ieee.std_logic_1164.all;

entity multOpBool is port(
	a,b: in std_logic_vector(1 downto 0);
	sel: in std_logic_vector(1 downto 0);
	salsumlogic: out std_logic_vector(1 downto 0)
);
end entity;
architecture arqmultopbool of multOpBool is
signal sand, sor, sxor, snot: std_logic_vector( 1 downto 0);
begin
	sand <= a and b;
	sor  <= a or b;
	sxor <= a xor b;
	snot <= not a;
	with sel select
	salsumlogic <= 	sand when "00",
							sor when "01",
							sxor when "10",
							snot when "11",
							"00" when others;
end architecture;

