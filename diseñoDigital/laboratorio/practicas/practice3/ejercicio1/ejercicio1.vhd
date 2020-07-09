library ieee;
use ieee.std_logic_1164.all;

entity ejercicio1 is 
port(
    SEL: in  std_logic_vector(1 downto 0);
    --A: in std_logic_vector(3 downto 0); 
	 --si tengo valores directos no es necesario el vector
	 F: out std_logic
	 );
end ejercicio1;

architecture arqMUX of ejercicio1 is 
begin 
with SEL select
	F <= '0' when "00",
        '1' when "01",
        '1' when "10",
        '1' when "11",
        '0' when others;
end arqMUX; 