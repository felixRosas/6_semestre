library ieee;
use ieee.std_logic_1164.all;
entity top is port (
	clk, inicio, x: in std_logic;
	var1,var0: out std_logic
);
end entity;

architecture arqtop of top is 
signal clk2: std_logic;
begin
	u1:entity work.relojlento(arqrelojlento) port map (clk, clk2);
	u2:entity work.ejercicio1(arqeje1) port map (clk2, inicio, x,var1,var0);

end architecture;