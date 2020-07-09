library ieee;
use ieee.std_logic_1164.all;
entity combinacional is port (
	E,Q2,Q1,Q0 : in std_logic;
	T2,T1,T0: out stD_logic

);
end combinacional;

architecture arqcomb of combinacional is
begin
	t2 <=((not Q2) and (not Q1) and (not Q0) and E) or (Q2 and Q1);
	t1	<=Q0 or (Q2 and Q1);
	t0 <=Q0 or ((not Q1) and (not E)) or ((not Q2) and Q1) or (Q2 and (not Q1));
end architecture;