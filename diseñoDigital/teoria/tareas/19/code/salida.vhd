library ieee;
use ieee.std_logic_1164.all;
entity salida is port(
   Q2, Q1, Q0: in std_logic;
	S: out std_logic_vector(1 downto 0)
);
end entity;
architecture arqsal of salida is
begin
	S(1) <= Q2 xor Q1;
	S(0) <= Q2 xor Q0;
end architecture;