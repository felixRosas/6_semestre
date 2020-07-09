library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity ejercicio3 is port(
	a, b: in std_logic_vector (1 downto 0);
	s0: in std_logic;
	cin: in std_logic;
	salsumarith: out std_logic_vector(1 downto 0);
	cout: out std_logic
);
end ejercicio3;

architecture arqejer3 of ejercicio3 is
signal sal: std_logic_vector(1 downto 0);
begin
	u1: entity work.mux2x1(arqmux) port map (b,s0,sal);
	u2: entity work.sum(arqsum) port map (a,sal,cin,salsumarith,cout);

end architecture;