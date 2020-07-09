LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY combinacional IS
PORT(
E, Q0, Q1: 	in std_logic;
D0, D1: 	out std_logic
);
END combinacional;

ARCHITECTURE arqcombinacional OF combinacional IS

BEGIN

D1	<=	(Q0 and E) or (Q1 and (not E));
D0	<=	Q0 xor E;
	
END arqcombinacional;