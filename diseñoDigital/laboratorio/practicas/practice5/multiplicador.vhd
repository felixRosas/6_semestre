library ieee;
use ieee. std_logic_1164.all;

entity multiplicador is port(
	a, b: in std_logic_vector(1 downto 0);
	cout: out std_logic_vector(2 downto 0)
);
end entity;

architecture arqmult of multiplicador is 
	signal carry, carry2: std_logic;
	signal cin: std_logic;
	signal b0a1, b1a0,b1a1: std_logic;
begin
	cin<='0';
	cout(0)<=a(0) and b(0);
	b0a1<= a(1) and b(0);
	b1a0<= a(0) and b(1);
	b1a1<= a(1) and b(1);
	sum1: entity work.sum(arqsum) port map (b0a1,b1a0,cin,cout(1),carry);
	sum2: entity work.sum(arqsum) port map (carry, b1a1,cin,cout(2),carry2);

end architecture; 