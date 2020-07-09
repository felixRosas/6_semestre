library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity top is port(
	clk,boton, reset: in std_logic;
	lamp: out std_logic;
	estado: out std_logic
);
end top;
architecture arqtop of top is
signal clk2: std_logic;
begin
	u1: entity work.relojlento(arqrelojlento) port map (clk, clk2);
	u2: entity work.luz(arqluz) port map (clk2, boton, reset,lamp, estado);
end architecture;