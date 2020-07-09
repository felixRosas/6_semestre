library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity df is 
port(
clk: in std_logic;
led: buffer std_logic:='0'
);

end df;

architecture arqdf of df is
signal contador: integer range 0 to 25000000;

begin

process (clk)
	begin
		if(clk' event and clk='1') then
			contador <= contador+1;
				if(contador=25000000) then
					contador<=0;
					led<=not(led);
				end if;
		end if;
	end process;	
end arqdf;

