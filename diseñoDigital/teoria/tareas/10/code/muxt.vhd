library ieee;
use ieee.std_logic_1164.all;

entity muxt is
port(
SEL: in std_logic;
a,b: in std_logic_vector(1 downto 0);
sal: out std_logic_vector(1 downto 0));
end muxt;


architecture arqmuxt of muxt is
BEGIN 	
with sel select 
sal<= a when '0',
		b when '1';
 
end architecture arqmuxt;