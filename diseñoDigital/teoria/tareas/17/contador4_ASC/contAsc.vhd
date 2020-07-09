library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity contAsc is
port(
	clk:		in		STD_LOGIC;
	reset:	in		STD_LOGIC;
	count:	out	STD_LOGIC_VECTOR(3 downto 0)
);
end contAsc;

architecture arccontAsc of contAsc is

signal conector: std_logic;

begin

	u1: entity work.relojlento(arcrelojlento) port map(clk, conector);
	u2: entity work.cont(behaviour) port map(conector, reset, count);

end arccontAsc;