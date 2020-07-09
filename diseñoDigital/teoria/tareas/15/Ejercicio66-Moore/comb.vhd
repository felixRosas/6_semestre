library ieee;
use ieee.std_logic_1164.all;

entity comb is port(
	q0,q1: in std_logic;
	j0,k0,j1,k1: out std_logic:= '0' 
);
end comb;

architecture arqComb of comb is
begin
	j0 <= '1';
	k0 <= '1';
	j1 <= q0;
	k1 <= q0;

end arqComb;