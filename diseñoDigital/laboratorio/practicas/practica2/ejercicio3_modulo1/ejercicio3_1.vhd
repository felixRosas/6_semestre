library ieee;
use ieee.std_logic_1164.all;

entity ejercicio3_1 is
port(a,b: IN std_logic; 
	  f:OUT std_logic
	  );
end ejercicio3_1;


architecture arqmain of ejercicio3_1 is
signal cable1,cable2: std_logic;
begin
	u1:entity work.cor(arqcor) port map (a,b,cable1);
	u2:entity work.cor(arqcor) port map (a,b,cable2);
	u3:entity work.cand(arqcand) port map (cable1,cable2,f);
end architecture arqmain;

