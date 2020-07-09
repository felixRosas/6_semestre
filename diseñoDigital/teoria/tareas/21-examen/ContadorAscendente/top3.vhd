library ieee;
use ieee.std_logic_1164.all;
entity top3 is port(
	clk, reset: in std_logic;
	cs: in std_logic;
	bus_datos: out std_logic_vector(6 downto 0)	
);
end top3;
architecture arqtop3 of top3 is 
signal count:std_logic_vector(2 downto 0);

begin
	w1: entity work.top2(arqtop2) port map (clk,reset,count);
	w2: entity work.rom(arqrom) port map (count,cs,bus_datos);
end architecture;