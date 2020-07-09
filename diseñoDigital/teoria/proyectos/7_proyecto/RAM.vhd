library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is 
port(
	clk : in std_logic;
	addr : in std_logic(7 downto 0);
	RW : in std_logic;
	D : in std_logic_vector(7 downto 0);
	l : out std_logic_vector(7 downto 0));
end entity RAM; 

architecture behavior of RAM is 
	type matrix is array (0 to 254) of std_logic_vector(7 downto 0);
	signal memory : matrix;
begin 
	process(clk)
	begin 
		if RW = '1' then 
				l <= memory(to integer (unsigned(addr)));
		elsif rising_edge(clk) then
			memory(to integer(signed(addr))) <= D;
		end if;
	end process;
end architecture behavior; 