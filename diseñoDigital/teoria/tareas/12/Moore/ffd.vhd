LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY ffd IS
PORT(
d, clk: 	in std_logic;
Q: out std_logic
);
END ffd;

ARCHITECTURE arqffd OF ffd IS

SIGNAL sclk: std_logic;

BEGIN

u1:entity work.relojlento(arqrelojlento) port map(clk, sclk);
u2:entity work.secuencial(arqsecuencial) port map(d, sclk, Q);
	
END arqffd;