library ieee;
use ieee.std_logic_1164.all;

entity top is port(
	
	a,s,b: in std_logic_vector(1 downto 0);
	cin: in std_logic;
	sout: out std_logic_vector(1 downto 0); 
	Cout: out std_logic
);
end entity top;

architecture arqtop of top is
signal cable1: std_logic_vector(1 downto 0);
begin
	u1: entity work.mux4x1(arqmux4x1) port map (s,b,cable1);
	u2: entity work.sum(arqsum) port map(a,cable1,Cin,sout,Cout);
end architecture arqtop;