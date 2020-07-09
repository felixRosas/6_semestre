library ieee;
use ieee.std_logic_1164.all;
entity contadores is port(
	E, clk: in std_logic;
	cs: in std_logic;
	bus_datos: out std_logic_vector(6 downto 0)
	--sd: out std_logic_vector(1 downto 0)
);
end contadores;

architecture arqcont of contadores is 
signal s:std_logic_vector(1 downto 0);

begin
	x1: entity work.top(arqtop) port map (E,clk,s);
	--sd<=s;
	x2: entity work.rom(arqrom) port map (s,cs,bus_datos);
end architecture;