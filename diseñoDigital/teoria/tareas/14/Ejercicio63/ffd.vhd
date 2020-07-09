library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_UNSIGNED.all;

entity ffd is 
port(
d,clk: in std_logic;
Q: out std_logic
);

end ffd;

architecture arqffd of ffd is
signal contador: integer range 0 to 100000000;

begin

process (clk)
	begin
		if(clk' event and clk='1') then
			contador <= contador+1;
				if(contador=50000000) then
					contador<=0;
					Q<=d;
				end if;
		end if;
	end process;	
end arqffd;

