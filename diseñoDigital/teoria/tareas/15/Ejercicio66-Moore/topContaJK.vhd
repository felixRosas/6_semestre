library ieee;
use ieee.std_logic_1164.all;


entity topContaJK is port(
clk: in std_logic;
sq0,sq1: out std_logic
);
end topContaJK;

architecture arqTopContaJK of topContaJK is
signal cable, j0,j1,k0,k1,q0,q1: std_logic;
begin
	u1:Entity work.relojLento(arqrelojlento) port map(clk,cable);
	u2:Entity work.comb(arqComb) port map(q0,q1,j0,k0,j1,k1);
	u3:Entity work.topFF(arqtopFF) port map(cable,j0,k0,j1,k1,q0,q1);
	sq0<= q0;
	sq1<= q1;
end arqTopContaJK;