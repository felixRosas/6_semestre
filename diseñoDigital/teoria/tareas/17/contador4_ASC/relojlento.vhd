LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_ARITH.ALL;

ENTITY relojlento IS
	PORT(
		clk: 		in std_logic;
		sclk: 		buffer std_logic:='0'
	);
END relojlento;

ARCHITECTURE arcrelojlento OF relojlento IS

SIGNAL conteo: integer range 0 to 25000000;

BEGIN

PROCESS(clk)
BEGIN
	IF(clk'EVENT and clk='1') THEN
		conteo <= conteo + 1;
		IF (conteo = 25000000) THEN
			CONTEO	<=	0;
			sclk		<=	not(sclk);
		END IF;
	END IF;
END PROCESS;
	
END arcrelojlento;