library ieee;
use ieee.std_logic_1164.all;

entity examen2 is
port(
SEL: in std_logic_vector(1 downto 0);
a,b: IN std_logic; 
f:OUT std_logic
);
end examen2;


architecture arqmain of examen2 is
signal cand,cor,cxor,cnot: std_logic;
begin
	--Operaciones previas
	cand <= a and b;
	cor <= a or b;
	cxor <= a xor b;
	cnot <= not a;	
	
	--Vaidacion de la tabla  
	with SEL select
	f <=  cand when "00",
         cor when "01",
         cxor when "10",
         cnot when "11",
        '0' when others;
	
end architecture arqmain;