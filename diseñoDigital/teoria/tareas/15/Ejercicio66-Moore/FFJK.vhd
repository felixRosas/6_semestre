library ieee;
use ieee.std_logic_1164.all;

entity FFJK is port(
	clkl,j,k: in std_logic;
	q,notQ: inout std_logic:= '0' 
);
end FFJK;

architecture arqFFJK of FFJK is
begin
	process(clkl)
	begin
		if rising_edge(clkl) then 
			q <= (q and (not k)) or (not (q) and j);
			notQ<= not q;
		end if;	
	end process;
end arqFFJK;