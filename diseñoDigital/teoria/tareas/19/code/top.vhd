library ieee;
use ieee.std_logic_1164.all;
entity top is port (
	E, clk: in std_logic;
	S: out std_logic_vector(1 downto 0)
);
end entity;
architecture arqtop of top is
signal clk25: std_logic;
begin
	u2: entity work.relojlento(arqrelojlento) port map (clk,clk25);
	u3: entity work.cont2b(arqcont2b) port map (E,clk25,S);
end architecture;