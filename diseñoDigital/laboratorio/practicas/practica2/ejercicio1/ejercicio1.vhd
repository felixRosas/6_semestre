library ieee;
use ieee.std_logic_1164.all;

entity ejercicio1 is 
port(e: in std_logic_vector(1 downto 0);
c: out std_logic ); 
end ejercicio1;

architecture arqexe1 of ejercicio1 is 
begin 
with e select
c <= '1' when "11", --Dos comillas mas de un bit
	  '0' when others;
	
end architecture arqexe1;



