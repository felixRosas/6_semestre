LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_ARITH.ALL;

ENTITY relojlento IS
PORT(
clkl: in std_logic;
sclk: buffer std_logic:='0'
);
END relojlento;

ARCHITECTURE arqrelojlento OF relojlento IS

SIGNAL conteo: integer range 0 to 25000000;

BEGIN

PROCESS(clkl)
BEGIN
	IF(clkl'EVENT and clkl='1') THEN
		conteo <= conteo + 1;
		IF (conteo = 25000000) THEN
			CONTEO	<=	0;
			sclk		<=	not(sclk);
		END IF;
	END IF;
END PROCESS;
	
END arqrelojlento;