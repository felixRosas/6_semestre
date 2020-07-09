library ieee;
use ieee.std_logic_1164.all;

entity compuertas is
port(
SEL: in std_logic_vector(1 downto 0);
a,b: in std_logic_vector(1 downto 0);
F: out std_logic_vector(1 downto 0));
end compuertas;


architecture arqcomp of compuertas is
signal cand,cor, cxor, cnot: std_logic_vector(1 downto 0);
BEGIN 
	cand <= a and b;
	cor <= a or b;
	cxor <= a xor b;
	cnot <= not a;
	
	with SEL select 
	F <= cand when "00",
		  cor when "01",
		  cxor when "10",
		  cnot when "11";
		  --'0' when others;
	
 
end architecture arqcomp;