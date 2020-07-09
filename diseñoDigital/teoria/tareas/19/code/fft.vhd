library ieee;
use ieee.std_logic_1164.all;
entity fft is port(
	t, clk: in std_logic;
	q, notq: inout std_logic
);
end entity;

architecture arqfft of fft is
begin
	process (clk)
	begin
		
		if clk'event and clk='1' then
				q<= t xor q;
				notq<= not q;
			end if;
	end process;
end architecture;