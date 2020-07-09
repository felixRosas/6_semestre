library ieee;
use ieee.stD_logic_1164.all;
entity sum is port(
	a,b,cin: in std_logic;
	salsum : out std_logic;
	cout: out std_logic
);
end entity sum;
architecture arqsum of sum is 
signal mid: std_logic_vector(2 downto 0);

begin
	salsum<= a xor b xor cin;
	cout<= (a and b) or ((a xor b)and cin);
end architecture;
	