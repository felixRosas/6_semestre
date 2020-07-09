library ieee;
use ieee.std_logic_1164.all;

entity mux2x1 is port(
	b: in std_logic_vector(1 downto 0);
	s: in std_logic;
	sal: out std_logic_vector(1 downto 0)
);

end mux2x1;

architecture arqmux of mux2x1 is

begin
	with s select
	sal	<=		not b when '1',
					b	when '0',
					"00" when others;
	

end arqmux;