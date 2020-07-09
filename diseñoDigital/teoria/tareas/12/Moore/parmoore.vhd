LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY parmoore IS
PORT(
E, clk: 	in std_logic;
S: 		out std_logic
	);
END parmoore;

ARCHITECTURE arqparmoore OF parmoore IS

SIGNAL D0, D1: std_logic;
SIGNAL Q0, Q1: std_logic;

BEGIN

u1:entity work.combinacional(arqcombinacional) port map(E, Q0, Q1, D0, D1);
u2:entity work.ffd(arqffd) port map(D0, clk, Q0);
u3:entity work.ffd(arqffd) port map(D1, clk, Q1);
u4:entity work.salida(arqsalida) port map(Q0,Q1,S);
				
END arqparmoore;