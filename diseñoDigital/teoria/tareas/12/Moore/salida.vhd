LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY salida IS
PORT(
Q0, Q1: 	in std_logic;
S: out std_logic
	);
END salida;

ARCHITECTURE arqsalida OF salida IS

BEGIN

S	<=	Q1 and (not Q0);
	
END arqsalida;