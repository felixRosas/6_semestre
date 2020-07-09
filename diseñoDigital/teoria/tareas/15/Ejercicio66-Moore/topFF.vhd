library ieee;
use ieee.std_logic_1164.all;

entity topFF is port(
clk,j0,k0,j1,k1: in std_logic;
q0,q1: inout std_logic
);
end topFF;

architecture arqtopFF of topFF is
begin
	u1:Entity work.FFJK(arqFFJK) port map(clk,j0,k0,q0,'0');
	u2:Entity work.FFJK(arqFFJK) port map(clk,j1,k1,q1,'0');
end arqtopFF;