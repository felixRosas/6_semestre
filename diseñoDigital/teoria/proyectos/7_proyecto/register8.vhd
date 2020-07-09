library ieee; 
use ieee.std_logic_1164.all;

entity register8 is
port( clk : in std_logic;
		ld: in std_logic;
		D : in std_logic_vector(7 downto 0);
		Q: out std_logic_vector(7 downto 0) 
);
end entity register8;

architecture behavior of register8 is 
	signal R: std_logic_vector(7 downto 0) := x"00";

begin 
		process(clk) 
			begin 
			if rising_edge(clk) then
				if ld ='1' then 
					R <= D;
				end if;
			end if;
		end process;
		Q <= R;
end architecture behavior;