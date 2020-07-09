library ieee;
use ieee.std_logic_1164.all;

entity negado is 
port(
a: in std_logic; 
c: out std_logic); --Salida de la compuerta -> Solo un bit
end negado;

architecture arqprac1 of negado is 
begin 
c <= not a; 
end architecture arqprac1;