library ieee;
use ieee.std_logic_1164.all;

entity topdisplay is
port(
sealu: in std_logic_vector(2 downto 0);
a,b: in std_logic_vector (1 downto 0);
cin: in std_logic;
d1,d2,d3: out std_logic_vector(7 downto 0)
);
end topdisplay;


architecture arqtopd of topdisplay is
signal salalu: std_logic_vector(1 downto 0);
signal salcout: std_logic;
BEGIN 
u1: entity work.topalu(arqtopalu) port map(sealu,a,b,cin,salalu,salcout);

with salalu(0) select

d1 <= "11000000" when '0',
		"11111001" when '1';

with salalu(1) select

d2 <= "11000000" when '0',
		"11111001" when '1';
		
with salcout select

d3 <= "11000000" when '0',
		"11111001" when '1';

end architecture arqtopd;

