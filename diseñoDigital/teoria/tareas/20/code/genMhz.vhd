library ieee;
use ieee.std_logic_arith.all;
use ieee.std_logic_1164.all;
entity genMhz is port(
clk50mhz: in std_logic;
clk25mhz: buffer std_logic:= '0' 
);
end genMhz;

architecture arqgenMhz of genMhz is
begin
process(clk50mhz)
	begin
		if(clk50mhz' event and clk50mhz='1') then
			clk25mhz<= not clk25mhz;
		end if;
	end process;
end arqgenMhz;