library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is
port(
SEL: in std_logic_vector(1 downto 0);
b: in std_logic_vector(1 downto 0);
sal: out std_logic_vector(1 downto 0));
end mux2x1;


architecture arqmux21 of mux2x1 is
BEGIN 	
with sel select 
sal<= "00" when "00",
		b when "01",
		not b when "10",
		"11" when "11";
 
end architecture arqmux21;